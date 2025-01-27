-- Criação do banco de dados
CREATE DATABASE ProjetoV8;
\c ProjetoV8
 
-- Tabela para informações básicas sobre pessoas
CREATE TABLE Pessoa (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    CPF CHAR(11) NOT NULL UNIQUE,
    data_Nascimento DATE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Role VARCHAR(5) CHECK (Role IN ('Comum', 'RH')) NOT NULL
);
 
-- Tabela para candidatos específicos
CREATE TABLE Candidato (
    ID INT PRIMARY KEY,
    nome_Completo VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15),
    Genero VARCHAR(10) CHECK (Genero IN ('Masculino', 'Feminino', 'Outro')),
    Endereco VARCHAR(255),
    Numero VARCHAR(10),
    Complemento VARCHAR(255),
    Bairro VARCHAR(255),
    Cidade VARCHAR(255),
    Estado CHAR(2),
    FOREIGN KEY (ID) REFERENCES Pessoa(ID)
);
 
-- Tabela para funcionários específicos
CREATE TABLE Funcionario (
    ID INT PRIMARY KEY,
    Departamento VARCHAR(100),
    Funcao VARCHAR(100),
    FOREIGN KEY (ID) REFERENCES Pessoa(ID)
);
 
-- Tabela para detalhes das vagas de emprego
CREATE TABLE Vaga (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    tipo_Vaga VARCHAR(100),
    Localidade VARCHAR(255),
    modelo_Vaga VARCHAR(10) CHECK (modelo_Vaga IN ('Presencial', 'Remoto', 'Hibrido')),
    Descricao TEXT,
    Responsabilidade TEXT,
    Requisitos TEXT,
    faixa_Salarial VARCHAR(100),
    regime_Contratacao VARCHAR(100),
    Beneficios TEXT,
    Status VARCHAR(7) CHECK (Status IN ('Aberta', 'Fechada')) NOT NULL,
    quantidade_Vagas INT,
    responsavel_ID INT,
    data_Criacao DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (responsavel_ID) REFERENCES Funcionario(ID)
);
 
-- Tabela para armazenar dados adicionais dos candidatos
CREATE TABLE dados_Adicionais (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    indicacao_Vaga VARCHAR(255),
    email_Indicacao VARCHAR(255),
    ex_Funcionario VARCHAR(3) CHECK (ex_Funcionario IN ('Sim', 'Nao')),
    pretensao_Salarial NUMERIC(10, 2),
    fonte_Vaga VARCHAR(255),
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID)
);
 
-- Tabela para registros de provas relacionadas às vagas
CREATE TABLE Prova (
    ID SERIAL PRIMARY KEY,
    vaga_ID INT,
    Descricao TEXT,
    FOREIGN KEY (vaga_ID) REFERENCES Vaga(ID)
);
 
-- Tabela consolidada para avaliação final dos candidatos
CREATE TABLE resultado_Final (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    vaga_ID INT,
    prova_ID INT,
    nota_Prova NUMERIC(5, 2),
    Aderencia NUMERIC(5, 2), -- Valor calculado pela IA
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID),
    FOREIGN KEY (vaga_ID) REFERENCES Vaga(ID),
    FOREIGN KEY (prova_ID) REFERENCES Prova(ID)
);
 
-- Tabela para as candidaturas dos candidatos às vagas
CREATE TABLE vagas_Aplicadas (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    vaga_ID INT,
    nome_Indicacao VARCHAR(255),
    resultado_Final_ID INT, -- Referência ao resultado final
    Status VARCHAR(100),
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID),
    FOREIGN KEY (vaga_ID) REFERENCES Vaga(ID),
    FOREIGN KEY (resultado_Final_ID) REFERENCES resultado_Final(ID)
);
 
-- Tabelas de competências e qualificações dos candidatos
CREATE TABLE detalhes_Experiencia (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    Titulo VARCHAR(255),
    Empresa VARCHAR(255),
    Descricao TEXT,
    Localidade VARCHAR(255),
    Modelo VARCHAR(10) CHECK (Modelo IN ('Presencial', 'Remoto', 'Hibrido')),
    Competencias TEXT,
    dt_Inicio DATE,
    dt_Final DATE,
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID)
);
 
CREATE TABLE detalhes_Formacao (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    nome_Instituicao VARCHAR(255),
    Escolaridade VARCHAR(255),
    Area VARCHAR(255),
    dt_Inicio DATE,
    dt_Final DATE,
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID)
);
 
CREATE TABLE Certificado (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    Nome VARCHAR(255),
    dt_Emissao DATE,
    dt_Vencimento DATE,
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID)
);
 
CREATE TABLE detalhes_Habilidades (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    Habilidade VARCHAR(255),
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID)
);
 
CREATE TABLE detalhes_Idiomas (
    ID SERIAL PRIMARY KEY,
    candidato_ID INT,
    Nome VARCHAR(255),
    Proficiencia VARCHAR(100),
    FOREIGN KEY (candidato_ID) REFERENCES Candidato(ID)
);
