CREATE TABLE professor(
	id_prof INTEGER PRIMARY KEY,
	nome VARCHAR(30)
);

CREATE TABLE aluno(
	id_aluno INTEGER PRIMARY KEY,
	nome VARCHAR(30)
);

CREATE TABLE disciplina(
	id_disc INTEGER PRIMARY KEY,
	nome VARCHAR(30)
);


CREATE TABLE leciona(
	id_prof INTEGER,
	id_disc INTEGER,
	PRIMARY KEY (id_prof, id_disc),
	FOREIGN KEY (id_prof) REFERENCES professor (id_prof),
	FOREIGN KEY (id_disc) REFERENCES disciplina (id_disc)
);

CREATE TABLE prova(
	id_disc INTEGER,
	id_aluno INTEGER,
	id_prova INTEGER,
	nota NUMERIC(2, 1),
	PRIMARY KEY (id_disc, id_aluno, id_prova),
	FOREIGN KEY (id_disc) REFERENCES disciplina(id_disc),
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE assiste(
	id_disc INTEGER,
	id_aluno INTEGER,
	data DATE,
	faltas INTEGER,
	PRIMARY KEY (id_disc, id_aluno, data),
	FOREIGN KEY (id_disc) REFERENCES disciplina(id_disc),
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);



