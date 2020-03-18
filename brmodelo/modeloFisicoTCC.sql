/* modeloLogicoTCC: */

CREATE TABLE Evento (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(200),
    data DATE,
    etapa INTEGER,
    id_coordenador INTEGER
);

CREATE TABLE Chamada (
    turno VARCHAR(50),
    local VARCHAR(100),
    data DATE,
    id INTEGER PRIMARY KEY,
    id_evento INTEGER
);

CREATE TABLE Usuario (
    id INTEGER PRIMARY KEY,
    login VARCHAR(50),
    tipo INTEGER,
    senha VARCHAR(100)
);

CREATE TABLE Voluntario (
    nome VARCHAR(200),
    email VARCHAR(100),
    foto VARCHAR(200),
    cpf VARCHAR(15),
    id_usuario INTEGER PRIMARY KEY
);

CREATE TABLE Administrador (
    nome VARCHAR(200),
    tipo INTEGER,
    id_usuario INTEGER PRIMARY KEY
);

CREATE TABLE Contem (
    id_voluntario INTEGER,
    id_chamada INTEGER,
    presenca INTEGER
);

CREATE TABLE Participa (
    id_evento INTEGER,
    id_voluntario INTEGER,
    disponibilidade VARCHAR(100),
    PRIMARY KEY (id_evento, id_voluntario)
);
 
ALTER TABLE Evento ADD CONSTRAINT FK_Evento
    FOREIGN KEY (id_coordenador)
    REFERENCES Administrador (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Chamada ADD CONSTRAINT FK_Chamada
    FOREIGN KEY (id_evento)
    REFERENCES Evento (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Voluntario ADD CONSTRAINT FK_Voluntario
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id)
    ON DELETE CASCADE;
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id)
    ON DELETE CASCADE;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_Voluntario
    FOREIGN KEY (id_voluntario)
    REFERENCES Voluntario (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_Chamada
    FOREIGN KEY (id_chamada)
    REFERENCES Chamada (id)
    ON DELETE SET NULL;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_Evento
    FOREIGN KEY (id_evento)
    REFERENCES Evento (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_Voluntario
    FOREIGN KEY (id_voluntario)
    REFERENCES Voluntario (id_usuario)
    ON DELETE SET NULL;