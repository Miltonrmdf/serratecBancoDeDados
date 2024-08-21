CREATE TABLE artistas(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	genero VARCHAR (50)
)

CREATE TABLE albuns(
	id SERIAL,
	nome VARCHAR(100),
	id_artistas INTEGER, 
	PRIMARY KEY(id),
	FOREIGN KEY(id_artistas) REFERENCES artistas(id)
)

CREATE TABLE capas_albuns(
	id SERIAL PRIMARY KEY,
	tipo_midia VARCHAR(50) NOTNULL,
	id_album INTEGER UNIQUE REFERENCES albuns(id)
)