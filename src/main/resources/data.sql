-- ============================================================================
-- MASSA DE DADOS ADICIONAL PARA TESTES COMPLETA (VAGAS E CANDIDATURAS)
-- Senha padrão para todos os usuários: 'senhaSegura123'
-- Hash BCrypt comum: $2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6
-- ============================================================================

-- CANDIDATOS (Usuários) - ID 1..5
INSERT INTO TB_ONEM_CANDIDATO (
    id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario,
    cpf, dt_nascimento, genero, nr_telefone
)
VALUES
(1, NOW(), 0, 'Administrador Master', 'admin@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'ADMIN', '11122233344', '1980-01-01 00:00:00', 'MASCULINO', '11900001111'),
(2, NOW(), 0, 'Usuário Comum Teste', 'user@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '22233344455', '1995-05-20 00:00:00', 'FEMININO', '21900002222'),
(3, NOW(), 0, 'Candidato Real', 'candidato@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '33344455566', '2000-10-10 00:00:00', 'OUTRO', '31900003333'),
(4, NOW(), 0, 'Lucas Candidato Jr', 'lucas.jr@teste.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '44455566677', '2003-03-15 00:00:00', 'MASCULINO', '19900004444'),
(5, NOW(), 0, 'Sofia Desenvolvedora', 'sofia.dev@teste.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER', '55566677788', '1998-11-25 00:00:00', 'FEMININO', '41900005555');

-- EMPRESAS - ID 1..3
INSERT INTO TB_ONEM_EMPRESA (
    id_empresa, dt_criacao, deleted, nm_empresa, nr_telefone, endereco, cnpj, email
)
VALUES
(1, NOW(), 0, 'Tech Solutions Ltda', '1155554444', 'Av. Tecnologia, 100', '00001111222233', 'empresa@tech.com'),
(2, NOW(), 0, 'Alpha Consultoria Global', '2133332222', 'Rua Alfa, 500', '11112222333344', 'rh@alpha.com'),
(3, NOW(), 0, 'Beta Digital Innov.', '3144445555', 'Av. Beta, 1000', '22223333444455', 'contato@beta.com');

-- RECRUTADORES - ID 1..3
INSERT INTO TB_ONEM_RECRUTADOR (
    id_recrutador, dt_criacao, deleted, nm_recrutador, nr_telefone, cpf, email, senha_hash, id_empresa
)
VALUES
(1, NOW(), 0, 'Ana Recrutadora', '11988887777', '99988877766', 'ana@tech.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 1),
(2, NOW(), 0, 'João Recrutador', '21977776666', '88877766655', 'joao@alpha.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 2),
(3, NOW(), 0, 'Carla Tech Hunter', '31966665555', '77766655544', 'carla@beta.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 3);

-- VAGAS EXISTENTES (1..4) - mantendo originais
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES
(1, NOW(), 0, 'Vaga para Desenvolvedor Backend (Sênior)', 1, 1),
(2, DATEADD('DAY', -2, NOW()), 0, 'Vaga para Engenheiro Front-end (Pleno)', 2, 2),
(3, DATEADD('DAY', -5, NOW()), 0, 'Vaga para Analista de Dados Júnior', 3, 3),
(4, DATEADD('DAY', -10, NOW()), 1, 'Vaga para Coordenador de Projetos (Deletada)', 1, 1);

-- SKILLS iniciais (1..6)
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES
(1, NOW(), 0, 'Java', 'Linguagem'),
(2, NOW(), 0, 'SQL', 'Banco de Dados'),
(3, NOW(), 0, 'Spring', 'Framework'),
(4, NOW(), 0, 'JavaScript', 'Linguagem'),
(5, NOW(), 0, 'UX/UI', 'Design'),
(6, NOW(), 0, 'DevOps', 'Infra');

-- VAGA_SKILL (associações originais)
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES
(1, 1), (1, 3),
(2, 4), (2, 5),
(3, 2);

-- FORMAÇÕES (Candidato 3)
INSERT INTO TB_ONEM_FORMACAO (id_formacao, dt_criacao, nm_formacao, ds_formacao, nm_instituicao, dt_inicio, dt_fim, id_candidato) VALUES
(1, NOW(), 'Bacharelado em T.I.', 'Curso de 4 anos de sistemas de informação', 'Universidade FIAP', '2015-01-01 00:00:00', '2018-12-31 00:00:00', 3),
(2, NOW(), 'Pós-Graduação em Software', 'Especialização em arquitetura de microsserviços', 'Alura', '2023-08-01 00:00:00', NULL, 3);

-- CANDIDATO_SKILL (Candidato 3)
INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES
(3, 2), (3, 1), (3, 3), (3, 4);

-- CANDIDATURAS existentes (1..4)
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES
(1, DATEADD('DAY', -5, NOW()), 0, 1, 3),
(2, DATEADD('DAY', -1, NOW()), 0, 2, 3),
(3, DATEADD('HOUR', -12, NOW()), 0, 3, 2),
(4, DATEADD('DAY', -20, NOW()), 1, 3, 3);

-- STATUS_CANDIDATURA existentes
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES
(1, DATEADD('DAY', -5, NOW()), 'CANDIDATURA_REALIZADA', 1),
(2, DATEADD('DAY', -4, NOW()), 'AGUARDANDO_TESTE', 1),
(3, DATEADD('DAY', -3, NOW()), 'TESTE_ENVIADO', 1),
(4, DATEADD('DAY', -1, NOW()), 'CANDIDATURA_REALIZADA', 2),
(5, DATEADD('HOUR', -12, NOW()), 'CANDIDATURA_REALIZADA', 3);

-- TESTE e QUESTÃO originais
INSERT INTO TB_ONEM_TESTE (id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga) VALUES (1, NOW(), DATEADD('DAY', 7, NOW()), 0.0, 1);
INSERT INTO TB_ONEM_QUESTAO (id_questao, nv_dificuldade, enunciado_questao, alternativa_1, alternativa_2) VALUES (1, 2, 'O que é ORM?', 'Object Relational Mapping', 'Open Real Machine');
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (1, 1);

-- ============================================================================
-- NOVAS SKILLS (IDs 7..10)
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES
(7, NOW(), 0, 'Python', 'Linguagem'),
(8, NOW(), 0, 'AWS', 'Nuvem'),
(9, NOW(), 0, 'Kubernetes', 'Infra'),
(10, NOW(), 0, 'React', 'Framework');

-- ============================================================================
-- +15 VAGAS ADICIONAIS (IDs 5..19)
INSERT INTO TB_ONEM_VAGA (id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador) VALUES
(5, DATEADD('DAY', -1, NOW()), 0, 'Engenheiro DevOps Sênior', 1, 1),
(6, DATEADD('DAY', -3, NOW()), 0, 'Desenvolvedor Mobile React Native (Pleno)', 2, 2),
(7, DATEADD('DAY', -4, NOW()), 0, 'Product Designer (UX/UI)', 3, 3),
(8, DATEADD('DAY', -8, NOW()), 0, 'Analista de QA Automatizado', 1, 1),
(9, DATEADD('DAY', -15, NOW()), 0, 'Especialista em Cibersegurança', 2, 2),
(10, DATEADD('DAY', -12, NOW()), 0, 'Scrum Master', 3, 3),
(11, DATEADD('DAY', -6, NOW()), 0, 'Fullstack Developer Node + Java', 1, 1),
(12, DATEADD('DAY', -9, NOW()), 0, 'Database Administrator (DBA)', 2, 2),
(13, DATEADD('DAY', -7, NOW()), 0, 'Data Scientist (Python/ML)', 3, 3),
(14, DATEADD('DAY', -4, NOW()), 0, 'Cloud Engineer AWS', 1, 1),
(15, DATEADD('DAY', -2, NOW()), 0, 'Desenvolvedor Backend Python', 2, 2),
(16, DATEADD('DAY', -11, NOW()), 0, 'UX Researcher', 3, 3),
(17, DATEADD('DAY', -13, NOW()), 0, 'Engenheiro de Dados', 1, 1),
(18, DATEADD('DAY', -5, NOW()), 0, 'Analista de Suporte Técnico', 2, 2),
(19, DATEADD('DAY', -14, NOW()), 0, 'Machine Learning Engineer', 3, 3);

-- VAGA_SKILL: associações para novas vagas (exemplos)
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES
(5, 6),  (5, 9),   -- DevOps: DevOps, Kubernetes
(6, 10), (6, 4),   -- Mobile: React (web/native), JavaScript
(7, 5),            -- Product Designer: UX/UI
(8, 6),            -- QA: DevOps infra para pipelines
(9, 9),            -- Cybersecurity: Kubernetes infra
(10, 3),           -- Scrum Master: Spring (exemplo de integração com times Java)
(11, 1), (11, 4),  -- Fullstack: Java + JS
(12, 2),           -- DBA: SQL
(13, 7), (13, 8),  -- Data Scientist: Python, AWS
(14, 8), (14, 9),  -- Cloud Engineer: AWS + Kubernetes
(15, 7),           -- Backend Python: Python
(16, 5),           -- UX Researcher: UX/UI
(17, 2), (17, 8),  -- Eng. de Dados: SQL, AWS
(18, 2),           -- Suporte: SQL (ex.: queries diagnósticas)
(19, 7), (19, 8);  -- ML Engineer: Python, AWS

-- ============================================================================
-- +15 CANDIDATURAS NOVAS (IDs 5..19)
INSERT INTO TB_ONEM_CANDIDATURA (id_candidatura, dt_criacao, deleted, id_vaga, id_candidato) VALUES
(5, DATEADD('DAY', -1, NOW()), 0, 5, 4),
(6, DATEADD('DAY', -3, NOW()), 0, 6, 5),
(7, DATEADD('DAY', -8, NOW()), 0, 7, 2),
(8, DATEADD('DAY', -6, NOW()), 0, 8, 3),
(9, DATEADD('DAY', -2, NOW()), 0, 9, 4),
(10, DATEADD('DAY', -15, NOW()), 0, 10, 5),
(11, DATEADD('DAY', -1, NOW()), 0, 11, 3),
(12, DATEADD('DAY', -4, NOW()), 0, 12, 2),
(13, DATEADD('DAY', -10, NOW()), 0, 13, 4),
(14, DATEADD('DAY', -7, NOW()), 0, 14, 5),
(15, DATEADD('DAY', -12, NOW()), 0, 15, 3),
(16, DATEADD('DAY', -3, NOW()), 0, 16, 2),
(17, DATEADD('DAY', -9, NOW()), 0, 17, 4),
(18, DATEADD('DAY', -11, NOW()), 0, 18, 5),
(19, DATEADD('DAY', -14, NOW()), 0, 19, 3);

-- ============================================================================
-- STATUS_CANDIDATURA para as novas candidaturas (IDs 6..40 aproximado)
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (id_status_candidatura, dt_atualizacao, ds_status, id_candidatura) VALUES
-- Para candidatura 5
(6, DATEADD('DAY', -1, NOW()), 'CANDIDATURA_REALIZADA', 5),
(7, DATEADD('DAY', 0, NOW()), 'AGUARDANDO_TESTE', 5),

-- Para candidatura 6
(8, DATEADD('DAY', -3, NOW()), 'CANDIDATURA_REALIZADA', 6),

-- Para candidatura 7
(9, DATEADD('DAY', -8, NOW()), 'CANDIDATURA_REALIZADA', 7),
(10, DATEADD('DAY', -7, NOW()), 'REVISANDO_CV', 7),

-- Para candidatura 8
(11, DATEADD('DAY', -6, NOW()), 'CANDIDATURA_REALIZADA', 8),

-- Para candidatura 9
(12, DATEADD('DAY', -2, NOW()), 'CANDIDATURA_REALIZADA', 9),
(13, DATEADD('DAY', -1, NOW()), 'AGUARDANDO_ENTREVISTA', 9),

-- Para candidatura 10
(14, DATEADD('DAY', -15, NOW()), 'CANDIDATURA_REALIZADA', 10),

-- Para candidatura 11
(15, DATEADD('DAY', -1, NOW()), 'CANDIDATURA_REALIZADA', 11),
(16, DATEADD('HOUR', -20, NOW()), 'AGUARDANDO_TESTE', 11),

-- Para candidatura 12
(17, DATEADD('DAY', -4, NOW()), 'CANDIDATURA_REALIZADA', 12),

-- Para candidatura 13
(18, DATEADD('DAY', -10, NOW()), 'CANDIDATURA_REALIZADA', 13),
(19, DATEADD('DAY', -9, NOW()), 'TESTE_ENVIADO', 13),

-- Para candidatura 14
(20, DATEADD('DAY', -7, NOW()), 'CANDIDATURA_REALIZADA', 14),

-- Para candidatura 15
(21, DATEADD('DAY', -12, NOW()), 'CANDIDATURA_REALIZADA', 15),

-- Para candidatura 16
(22, DATEADD('DAY', -3, NOW()), 'CANDIDATURA_REALIZADA', 16),

-- Para candidatura 17
(23, DATEADD('DAY', -9, NOW()), 'CANDIDATURA_REALIZADA', 17),
(24, DATEADD('DAY', -8, NOW()), 'AGUARDANDO_FEEDBACK', 17),

-- Para candidatura 18
(25, DATEADD('DAY', -11, NOW()), 'CANDIDATURA_REALIZADA', 18),

-- Para candidatura 19
(26, DATEADD('DAY', -14, NOW()), 'CANDIDATURA_REALIZADA', 19),
(27, DATEADD('DAY', -13, NOW()), 'REJEITADA', 19);

-- ============================================================================
-- TESTES ADICIONAIS (alguns testes vinculados a vagas novas)
INSERT INTO TB_ONEM_TESTE (id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga) VALUES
(2, DATEADD('DAY', 0, NOW()), DATEADD('DAY', 7, NOW()), 0.0, 6),  -- teste para vaga 6
(3, DATEADD('DAY', -2, NOW()), DATEADD('DAY', 5, NOW()), 0.0, 13), -- teste para vaga 13
(4, DATEADD('DAY', -1, NOW()), DATEADD('DAY', 6, NOW()), 0.0, 15); -- teste para vaga 15

-- QUESTÕES adicionais
INSERT INTO TB_ONEM_QUESTAO (id_questao, nv_dificuldade, enunciado_questao, alternativa_1, alternativa_2) VALUES
(2, 3, 'Explique a diferença entre REST e GraphQL', 'REST é ...', 'GraphQL é ...'),
(3, 4, 'Como você otimiza uma query SQL com JOINs?', 'Usar índices', 'Evitar joins');

-- ASSOCIAÇÕES TESTE_QUESTAO
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES
(2, 2),
(3, 2),
(3, 3),
(4, 3);

-- ============================================================================
-- REAJUSTE/RESTART DE SEQUÊNCIAS / AUTO_INCREMENT (Adaptado para H2)
-- Observação: em H2 o comando para reiniciar identidade é ALTER TABLE ALTER COLUMN RESTART WITH ou reiniciar sequências se elas existirem.
-- Se suas colunas usam IDENTITY, tente o ALTER abaixo. Caso use SEQUENCE, ajuste para ALTER SEQUENCE ... RESTART WITH ...
ALTER TABLE TB_ONEM_CANDIDATO ALTER COLUMN ID_CANDIDATO RESTART WITH 6;
ALTER TABLE TB_ONEM_EMPRESA ALTER COLUMN ID_EMPRESA RESTART WITH 4;
ALTER TABLE TB_ONEM_RECRUTADOR ALTER COLUMN ID_RECRUTADOR RESTART WITH 4;
ALTER TABLE TB_ONEM_VAGA ALTER COLUMN ID_VAGA RESTART WITH 20;
ALTER TABLE TB_ONEM_SKILL ALTER COLUMN ID_SKILL RESTART WITH 11;
ALTER TABLE TB_ONEM_FORMACAO ALTER COLUMN ID_FORMACAO RESTART WITH 3;
ALTER TABLE TB_ONEM_CANDIDATURA ALTER COLUMN ID_CANDIDATURA RESTART WITH 20;
ALTER TABLE TB_ONEM_STATUS_CANDIDATURA ALTER COLUMN ID_STATUS_CANDIDATURA RESTART WITH 30;
ALTER TABLE TB_ONEM_TESTE ALTER COLUMN ID_TESTE RESTART WITH 5;
ALTER TABLE TB_ONEM_QUESTAO ALTER COLUMN ID_QUESTAO RESTART WITH 4;

-- ============================================================================
-- FIM DO SCRIPT
-- ============================================================================
