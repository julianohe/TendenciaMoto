CREATE DATABASE primeira_moto;
USE primeira_moto;

-- 1. Tabela de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    estado CHAR(2)
);

-- 2. Tabela de distribuidoras
CREATE TABLE distribuidoras (
    id_distribuidora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    estado CHAR(2)
);

-- 3. Tabela de lojas
CREATE TABLE lojas (
    id_loja INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    estado CHAR(2),
    telefone VARCHAR(20),
    id_distribuidora INT,
    FOREIGN KEY (id_distribuidora)
        REFERENCES distribuidoras(id_distribuidora)
);

-- 4. Tabela de marcas
CREATE TABLE marcas (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    pais_origem VARCHAR(100)
);

-- 5. Tabela de modelos
CREATE TABLE modelos (
    id_modelo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cilindrada INT,
    potencia DECIMAL(5,2),
    consumo_medio DECIMAL(5,2),
    peso DECIMAL(6,2),
    altura_banco DECIMAL(6,2),
    id_marca INT,
    FOREIGN KEY (id_marca)
        REFERENCES marcas(id_marca)
);

-- 6. Tabela de motos disponíveis
CREATE TABLE motos (
    id_moto INT PRIMARY KEY AUTO_INCREMENT,
    ano INT NOT NULL,
    cor VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT DEFAULT 0,
    id_modelo INT,
    id_loja INT,
    FOREIGN KEY (id_modelo)
        REFERENCES modelos(id_modelo),
    FOREIGN KEY (id_loja)
        REFERENCES lojas(id_loja)
);

-- 7. Tabela de avaliações dos clientes
CREATE TABLE avaliacoes (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE,
    id_cliente INT,
    id_modelo INT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_modelo)
        REFERENCES modelos(id_modelo)
);

-- 8. Tabela de vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    valor DECIMAL(10,2),
    id_cliente INT,
    id_moto INT,
    id_loja INT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_moto)
        REFERENCES motos(id_moto),
    FOREIGN KEY (id_loja)
        REFERENCES lojas(id_loja)
);