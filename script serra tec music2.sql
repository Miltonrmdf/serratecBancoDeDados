CREATE TABLE artistas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL
);

CREATE TABLE albuns (
    id SERIAL,
    nome VARCHAR(100) NOT NULL,
    id_artista INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (id_artista) REFERENCES artistas(id)
);

CREATE TABLE capas_albuns(
    id SERIAL PRIMARY KEY,
    tipo_midia VARCHAR(50) NOT NULL,
    id_album INTEGER UNIQUE REFERENCES albuns(id)
);

INSERT INTO artistas (nome, genero) VALUES ('Ludmila', 'Funk');
INSERT INTO albuns (nome, id_artista) VALUES ('Funk Brasil', 1);
INSERT INTO capas_albuns (tipo_midia, id_album) VALUES ('CD', 1);

SELECT * FROM artistas
SELECT * FROM albuns
SELECT * FROM capas_albuns

DROP TABLE capas_albuns;
DROP TABLE albuns;
DROP TABLE artistas;