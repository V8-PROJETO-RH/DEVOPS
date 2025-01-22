CREATE TABLE candidatos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    cpf VARCHAR(255),
    data_nascimento DATE,
    telefone VARCHAR(20),
    data_criacao TIMESTAMP,
    linkedin_profile VARCHAR(255)
);
 
-- Criando a tabela 'funcionarios'
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(20),
    departamento VARCHAR(100),
    data_criacao TIMESTAMP
);
 
-- Criando a tabela 'vagas'
CREATE TABLE vagas (
    id SERIAL PRIMARY KEY,
    id_funcionario INT REFERENCES funcionarios(id),
    nome VARCHAR(255),
    salario VARCHAR(50),
    quantidade INT,
    descricao VARCHAR(255),
    beneficios VARCHAR(255),
    responsavel VARCHAR(255),
    atribuicoes VARCHAR(255),
    contratacao VARCHAR(45),
    status VARCHAR(45),
    requisitos VARCHAR(255),
    modelo VARCHAR(45),
    data_criacao TIMESTAMP
);
 
-- Criando a tabela 'aderenciavagas'
CREATE TABLE aderenciavagas (
    id SERIAL PRIMARY KEY,
    id_candidato INT REFERENCES candidatos(id),
    id_vaga INT REFERENCES vagas(id),
    percentual_aderencia DECIMAL(5, 2),
    data_calculo TIMESTAMP
);
 
-- Criando a tabela 'provas'
CREATE TABLE provas (
    id SERIAL PRIMARY KEY,
    id_vaga INT REFERENCES vagas(id),
    descricao TEXT,
    data_criacao TIMESTAMP
);