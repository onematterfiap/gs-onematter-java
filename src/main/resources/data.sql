-- ============================================================================
-- MASSA DE DADOS COMPLETA (VAGAS E CANDIDATURAS) - SINTAXE ORACLE
-- Compatível com Spring Boot + GenerationType.SEQUENCE
-- IDs inseridos manualmente + sequences ajustadas manualmente depois
-- ============================================================================

-- CANDIDATOS (Usuários) - IDs 1..5
INSERT INTO TB_ONEM_CANDIDATO (id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario, cpf, dt_nascimento, genero, nr_telefone)
VALUES (1, SYSDATE, 0, 'Administrador Master', 'admin@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'ADMIN', '11122233344', TO_DATE('1980-01-01', 'YYYY-MM-DD'), 'MASCULINO', '11900001111');

INSERT INTO TB_ONEM_CANDIDATO (id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario, cpf, dt_nascimento, genero, nr_telefone)
VALUES (2, SYSDATE, 0, 'Usuário Comum Teste', 'user@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '22233344455', TO_DATE('1995-05-20', 'YYYY-MM-DD'), 'FEMININO', '21900002222');

INSERT INTO TB_ONEM_CANDIDATO (id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario, cpf, dt_nascimento, genero, nr_telefone)
VALUES (3, SYSDATE, 0, 'Candidato Real', 'candidato@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '33344455566', TO_DATE('2000-10-10', 'YYYY-MM-DD'), 'OUTRO', '31900003333');

INSERT INTO TB_ONEM_CANDIDATO (id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario, cpf, dt_nascimento, genero, nr_telefone)
VALUES (4, SYSDATE, 0, 'Lucas Candidato Jr', 'lucas.jr@teste.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '44455566677', TO_DATE('2003-03-15', 'YYYY-MM-DD'), 'MASCULINO', '19900004444');

INSERT INTO TB_ONEM_CANDIDATO (id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario, cpf, dt_nascimento, genero, nr_telefone)
VALUES (5, SYSDATE, 0, 'Sofia Desenvolvedora', 'sofia.dev@teste.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '55566677788', TO_DATE('1998-11-25', 'YYYY-MM-DD'), 'FEMININO', '41900005555');

-- EMPRESAS - IDs 1..3
INSERT INTO TB_ONEM_EMPRESA (id_empresa, dt_criacao, deleted, nm_empresa, nr_telefone, endereco, cnpj, email)
VALUES (1, SYSDATE, 0, 'Tech Solutions Ltda', '1155554444', 'Av. Tecnologia, 100', '00001111222233', 'empresa@tech.com');

INSERT INTO TB_ONEM_EMPRESA (id_empresa, dt_criacao, deleted, nm_empresa, nr_telefone, endereco, cnpj, email)
VALUES (2, SYSDATE, 0, 'Alpha Consultoria Global', '2133332222', 'Rua Alfa, 500', '11112222333344', 'rh@alpha.com');

INSERT INTO TB_ONEM_EMPRESA (id_empresa, dt_criacao, deleted, nm_empresa, nr_telefone, endereco, cnpj, email)
VALUES (3, SYSDATE, 0, 'Beta Digital Innov.', '3144445555', 'Av. Beta, 1000', '22223333444455', 'contato@beta.com');

-- RECRUTADORES - IDs 1..3
INSERT INTO TB_ONEM_RECRUTADOR (id_recrutador, dt_criacao, deleted, nm_recrutador, nr_telefone, cpf, email, senha_hash, id_empresa)
VALUES (1, SYSDATE, 0, 'Ana Recrutadora', '11988887777', '99988877766', 'ana@tech.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 1);

INSERT INTO TB_ONEM_RECRUTADOR (id_recrutador, dt_criacao, deleted, nm_recrutador, nr_telefone, cpf, email, senha_hash, id_empresa)
VALUES (2, SYSDATE, 0, 'João Recrutador', '21977776666', '88877766655', 'joao@alpha.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 2);

INSERT INTO TB_ONEM_RECRUTADOR (id_recrutador, dt_criacao, deleted, nm_recrutador, nr_telefone, cpf, email, senha_hash, id_empresa)
VALUES (3, SYSDATE, 0, 'Carla Tech Hunter', '31966665555', '77766655544', 'carla@beta.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 3);

-- VAGAS EXISTENTES - IDs 1..19
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (1, SYSDATE, 0, 'Vaga para Desenvolvedor Backend (Sênior)', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (2, SYSDATE - 2, 0, 'Vaga para Engenheiro Front-end (Pleno)', 2, 2);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (3, SYSDATE - 5, 0, 'Vaga para Analista de Dados Júnior', 3, 3);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (4, SYSDATE - 10, 1, 'Vaga para Coordenador de Projetos (Deletada)', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (5, SYSDATE - 1, 0, 'Engenheiro DevOps Sênior', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (6, SYSDATE - 3, 0, 'Desenvolvedor Mobile React Native (Pleno)', 2, 2);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (7, SYSDATE - 4, 0, 'Product Designer (UX/UI)', 3, 3);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (8, SYSDATE - 8, 0, 'Analista de QA Automatizado', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (9, SYSDATE - 15, 0, 'Especialista em Cibersegurança', 2, 2);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (10, SYSDATE - 12, 0, 'Scrum Master', 3, 3);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (11, SYSDATE - 6, 0, 'Fullstack Developer Node + Java', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (12, SYSDATE - 9, 0, 'Database Administrator (DBA)', 2, 2);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (13, SYSDATE - 7, 0, 'Data Scientist (Python/ML)', 3, 3);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (14, SYSDATE - 4, 0, 'Cloud Engineer AWS', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (15, SYSDATE - 2, 0, 'Desenvolvedor Backend Python', 2, 2);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (16, SYSDATE - 11, 0, 'UX Researcher', 3, 3);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (17, SYSDATE - 13, 0, 'Engenheiro de Dados', 1, 1);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (18, SYSDATE - 5, 0, 'Analista de Suporte Técnico', 2, 2);
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES (19, SYSDATE - 14, 0, 'Machine Learning Engineer', 3, 3);

-- SKILLS - IDs 1..10
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (1, SYSDATE, 0, 'Java', 'Linguagem');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (2, SYSDATE, 0, 'SQL', 'Banco de Dados');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (3, SYSDATE, 0, 'Spring', 'Framework');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (4, SYSDATE, 0, 'JavaScript', 'Linguagem');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (5, SYSDATE, 0, 'UX/UI', 'Design');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (6, SYSDATE, 0, 'DevOps', 'Infra');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (7, SYSDATE, 0, 'Python', 'Linguagem');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (8, SYSDATE, 0, 'AWS', 'Nuvem');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (9, SYSDATE, 0, 'Kubernetes', 'Infra');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (10, SYSDATE, 0, 'React', 'Framework');

-- VAGA_SKILL
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (1, 1); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (1, 3);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (2, 4); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (2, 5);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (3, 2);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (5, 6); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (5, 9);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (6, 10); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (6, 4);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (7, 5);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (8, 6);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (9, 9);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (10, 3);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (11, 1); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (11, 4);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (12, 2);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (13, 7); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (13, 8);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (14, 8); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (14, 9);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (15, 7);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (16, 5);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (17, 2); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (17, 8);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (18, 2);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (19, 7); INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (19, 8);

-- FORMAÇÕES (Candidato 3)
INSERT INTO TB_ONEM_FORMACAO (id_formacao, dt_criacao, nm_formacao, ds_formacao, nm_instituicao, dt_inicio, dt_fim, id_candidato)
VALUES (1, SYSDATE, 'Bacharelado em T.I.', 'Curso de 4 anos de sistemas de informação', 'Universidade FIAP', TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-12-31', 'YYYY-MM-DD'), 3);

INSERT INTO TB_ONEM_FORMACAO (id_formacao, dt_criacao, nm_formacao, ds_formacao, nm_instituicao, dt_inicio, dt_fim, id_candidato)
VALUES (2, SYSDATE, 'Pós-Graduação em Software', 'Especialização em arquitetura de microsserviços', 'Alura', TO_DATE('2023-08-01', 'YYYY-MM-DD'), NULL, 3);

-- CANDIDATO_SKILL (Candidato 3)
INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 2); INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 1);
INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 3); INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 4);

-- CANDIDATURAS - IDs 1..19
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (1, SYSDATE - 5, 0, 1, 3);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (2, SYSDATE - 1, 0, 2, 3);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (3, SYSDATE - 0.5, 0, 3, 2);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (4, SYSDATE - 20, 1, 3, 3);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (5, SYSDATE - 1, 0, 5, 4);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (6, SYSDATE - 3, 0, 6, 5);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (7, SYSDATE - 8, 0, 7, 2);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (8, SYSDATE - 6, 0, 8, 3);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (9, SYSDATE - 2, 0, 9, 4);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (10, SYSDATE - 15, 0, 10, 5);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (11, SYSDATE - 1, 0, 11, 3);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (12, SYSDATE - 4, 0, 12, 2);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (13, SYSDATE - 10, 0, 13, 4);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (14, SYSDATE - 7, 0, 14, 5);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (15, SYSDATE - 12, 0, 15, 3);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (16, SYSDATE - 3, 0, 16, 2);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (17, SYSDATE - 9, 0, 17, 4);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (18, SYSDATE - 11, 0, 18, 5);
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES (19, SYSDATE - 14, 0, 19, 3);

-- STATUS_CANDIDATURA
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (1, SYSDATE - 5, 'CANDIDATURA_REALIZADA', 1);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (2, SYSDATE - 4, 'AGUARDANDO_TESTE', 1);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (3, SYSDATE - 3, 'TESTE_ENVIADO', 1);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (4, SYSDATE - 1, 'CANDIDATURA_REALIZADA', 2);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (5, SYSDATE - 0.5, 'CANDIDATURA_REALIZADA', 3);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (6, SYSDATE - 1, 'CANDIDATURA_REALIZADA', 5);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (7, SYSDATE, 'AGUARDANDO_TESTE', 5);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (8, SYSDATE - 3, 'CANDIDATURA_REALIZADA', 6);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (9, SYSDATE - 8, 'CANDIDATURA_REALIZADA', 7);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (10, SYSDATE - 7, 'REVISANDO_CV', 7);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (11, SYSDATE - 6, 'CANDIDATURA_REALIZADA', 8);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (12, SYSDATE - 2, 'CANDIDATURA_REALIZADA', 9);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (13, SYSDATE - 1, 'AGUARDANDO_ENTREVISTA', 9);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (14, SYSDATE - 15, 'CANDIDATURA_REALIZADA', 10);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (15, SYSDATE - 1, 'CANDIDATURA_REALIZADA', 11);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (16, SYSDATE - 0.8, 'AGUARDANDO_TESTE', 11);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (17, SYSDATE - 4, 'CANDIDATURA_REALIZADA', 12);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (18, SYSDATE - 10, 'CANDIDATURA_REALIZADA', 13);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (19, SYSDATE - 9, 'TESTE_ENVIADO', 13);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (20, SYSDATE - 7, 'CANDIDATURA_REALIZADA', 14);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (21, SYSDATE - 12, 'CANDIDATURA_REALIZADA', 15);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (22, SYSDATE - 3, 'CANDIDATURA_REALIZADA', 16);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (23, SYSDATE - 9, 'CANDIDATURA_REALIZADA', 17);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (24, SYSDATE - 8, 'AGUARDANDO_FEEDBACK', 17);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (25, SYSDATE - 11, 'CANDIDATURA_REALIZADA', 18);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (26, SYSDATE - 14, 'CANDIDATURA_REALIZADA', 19);
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES (27, SYSDATE - 13, 'REJEITADA', 19);

-- TESTES
INSERT INTO TB_ONEM_TESTE (id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga) VALUES (1, SYSDATE, SYSDATE + 7, 0.0, 1);
INSERT INTO TB_ONEM_TESTE (id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga) VALUES (2, SYSDATE, SYSDATE + 7, 0.0, 6);
INSERT INTO TB_ONEM_TESTE (id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga) VALUES (3, SYSDATE - 2, SYSDATE + 5, 0.0, 13);
INSERT INTO TB_ONEM_TESTE (id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga) VALUES (4, SYSDATE - 1, SYSDATE + 6, 0.0, 15);

-- QUESTÕES
INSERT INTO TB_ONEM_QUESTAO (id_questao, nv_dificuldade, enunciado_questao, alternativa_1, alternativa_2) VALUES (1, 2, 'O que é ORM?', 'Object Relational Mapping', 'Open Real Machine');
INSERT INTO TB_ONEM_QUESTAO (id_questao, nv_dificuldade, enunciado_questao, alternativa_1, alternativa_2) VALUES (2, 3, 'Explique a diferença entre REST e GraphQL', 'REST é ...', 'GraphQL é ...');
INSERT INTO TB_ONEM_QUESTAO (id_questao, nv_dificuldade, enunciado_questao, alternativa_1, alternativa_2) VALUES (3, 4, 'Como você otimiza uma query SQL com JOINs?', 'Usar índices', 'Evitar joins');

-- TESTE_QUESTAO
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (1, 1);
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (2, 2);
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (3, 2); INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (3, 3);
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (4, 3);

-- COMMIT FINAL
COMMIT;