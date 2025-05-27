-- Tabela Investigador
CREATE TABLE Investigador (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    especialidade VARCHAR(100)
);

-- Tabela Instituicao
CREATE TABLE Instituicao (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50),
    tipo VARCHAR(50)
);

-- Tabela Projeto
CREATE TABLE Projeto (
    codigo INT PRIMARY KEY,
    titulo VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    orcamento_total DECIMAL(10,2),
    instituicao_id INT UNIQUE,
    coordenador_id INT UNIQUE,
    FOREIGN KEY (instituicao_id) REFERENCES Instituicao(id),
    FOREIGN KEY (coordenador_id) REFERENCES Investigador(id)
);

-- Tabela Financiamento
CREATE TABLE Financiamento (
    id INT PRIMARY KEY,
    valor DECIMAL(10,2),
    fonte VARCHAR(100),
    data DATE,
    projeto_codigo INT,
    FOREIGN KEY (projeto_codigo) REFERENCES Projeto(codigo)
);

-- Tabela Resultado
CREATE TABLE Resultado (
    id INT PRIMARY KEY,
    tipo VARCHAR(50),
    descricao TEXT,
    data DATE,
    projeto_codigo INT,
    FOREIGN KEY (projeto_codigo) REFERENCES Projeto(codigo)
);

-- Tabela Participacao (investigador participa em projeto)
CREATE TABLE Participacao (
    projeto_codigo INT,
    investigador_id INT,
    funcao VARCHAR(100),
    percentagem_dedicacao DECIMAL(5,2),
    PRIMARY KEY (projeto_codigo, investigador_id),
    FOREIGN KEY (projeto_codigo) REFERENCES Projeto(codigo),
    FOREIGN KEY (investigador_id) REFERENCES Investigador(id)
);
