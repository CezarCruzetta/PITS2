-- TABLE
CREATE TABLE Tabela_Acordo (
    id_acord VARCHAR(20) NOT NULL PRIMARY KEY,
    Status BOOLEAN NOT NULL,
    Prazo INTEGER NOT NULL,
    Datalimite DATE,
    Tipo VARCHAR(20) NOT NULL,
    Valor DECIMAL,
    id_client VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_client) REFERENCES Tabela_Clientes(id_client)
);
CREATE TABLE Tabela_ClienteConta (
    id_client VARCHAR(20) NOT NULL,
    id_conta VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_client, id_conta),
    FOREIGN KEY (id_client) REFERENCES Tabela_Clientes(id_client),
    FOREIGN KEY (id_conta) REFERENCES Tabela_Conta(id_conta)
);
CREATE TABLE Tabela_Clientes (
    id_client VARCHAR(20) NOT NULL PRIMARY KEY,
    DtaNasc DATE NOT NULL CHECK(DtaNasc >= DATE('1900-01-01')), -- Validação para maiores de idade pode ser tratada na aplicação
    CPF VARCHAR(11) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    Rua VARCHAR(50),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado CHAR(2),
    CEP CHAR(8),
    id_func VARCHAR(20),
    FOREIGN KEY (id_func) REFERENCES Tabela_Funcionarios(id_func)
);
CREATE TABLE Tabela_Conta (
    id_conta VARCHAR(20) NOT NULL PRIMARY KEY,
    NumeroConta VARCHAR(20) NOT NULL,
    TipoConta VARCHAR(50) NOT NULL,
    Saldo DECIMAL NOT NULL,
    DataAbertura DATE
);
CREATE TABLE Tabela_Credito (
    id_cred VARCHAR(20) NOT NULL PRIMARY KEY,
    DataConsult DATE,
    Fontes VARCHAR(50),
    Pontos INTEGER NOT NULL,
    Justificativa TEXT,
    id_client VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_client) REFERENCES Tabela_Clientes(id_client)
);
CREATE TABLE Tabela_Funcionarios (
    id_func VARCHAR(20) NOT NULL PRIMARY KEY,
    Salario DECIMAL,
    NomeFunc VARCHAR(50) NOT NULL,
    EmailFunc VARCHAR(50),
    Cargo VARCHAR(50),
    CPFfunc VARCHAR(11),
    TelefoneFunc VARCHAR(11) NOT NULL,
    id_set VARCHAR(20),
    FOREIGN KEY (id_set) REFERENCES Tabela_Setor(id_set)
);
CREATE TABLE Tabela_Pagamentos (
    id_pag VARCHAR(20) NOT NULL PRIMARY KEY,
    DtaPag DATE NOT NULL,
    Valor DECIMAL NOT NULL,
    Status VARCHAR(20) NOT NULL,
    id_acordo VARCHAR(20),
    FOREIGN KEY (id_acordo) REFERENCES Tabela_Acordo(id_acord)
);
CREATE TABLE Tabela_Setor (
    id_set VARCHAR(20) NOT NULL PRIMARY KEY,
    NomeSet VARCHAR(50) NOT NULL,
    NumSet VARCHAR(20) NOT NULL,
    id_func_gerente VARCHAR(20),
    FOREIGN KEY (id_func_gerente) REFERENCES Tabela_Funcionarios(id_func)
);
CREATE TABLE Tabela_Telefones (
    id_telefone VARCHAR(20) NOT NULL PRIMARY KEY,
    Telefone VARCHAR(11) NOT NULL,
    id_client VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_client) REFERENCES Tabela_Clientes(id_client)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
