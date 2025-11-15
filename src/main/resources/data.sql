-- ============================================================================
-- CONFIGURAÇÃO DE SEGURANÇA E DADOS DE USUÁRIOS (CANDIDATOS/ADMIN)
-- Senha padrão: 'senhaSegura123'
-- Hash BCrypt: $2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6
-- ============================================================================

-- CANDIDATOS (Usuários) - ID 1, 2, 3
INSERT INTO TB_ONEM_CANDIDATO (
    id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario,
    cpf, dt_nascimento, genero, nr_telefone
)
VALUES (
    1, NOW(), 0, 'Administrador Master', 'admin@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'ADMIN',
    '11122233344', '1980-01-01 00:00:00', 'MASCULINO', '11900001111'
);

INSERT INTO TB_ONEM_CANDIDATO (
    id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario,
    cpf, dt_nascimento, genero, nr_telefone
)
VALUES (
    2, NOW(), 0, 'Usuário Comum Teste', 'user@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER',
    '22233344455', '1995-05-20 00:00:00', 'FEMININO', '21900002222'
);

INSERT INTO TB_ONEM_CANDIDATO (
    id_candidato, dt_criacao, deleted, nm_candidato, ds_email, ds_senha_hash, tp_usuario,
    cpf, dt_nascimento, genero, nr_telefone
)
VALUES (
    3, NOW(), 0, 'Candidato Real', 'candidato@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER',
    '33344455566', '2000-10-10 00:00:00', 'OUTRO', '31900003333'
);

-- ============================================================================
-- DADOS DE GERENCIAMENTO (ADMIN)
-- ============================================================================

-- EMPRESA - ID 1 (Sem senha_hash)
INSERT INTO TB_ONEM_EMPRESA (
    id_empresa, dt_criacao, deleted, nm_empresa, nr_telefone, endereco, cnpj, email
)
VALUES (
    1, NOW(), 0, 'Tech Solutions Ltda', '1155554444', 'Av. Tecnologia, 100', '00001111222233', 'empresa@tech.com'
);

-- RECRUTADOR - ID 1 (FK para Empresa 1)
INSERT INTO TB_ONEM_RECRUTADOR (
    id_recrutador, dt_criacao, deleted, nm_recrutador, nr_telefone, cpf, email, senha_hash, id_empresa
)
VALUES (
    1, NOW(), 0, 'Ana Recrutadora', '11988887777', '99988877766', 'ana@tech.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 1
);

-- VAGA - ID 1 (FK para Empresa 1 e Recrutador 1)
INSERT INTO TB_ONEM_VAGA (
    id_vaga, dt_criacao, deleted, ds_vaga, id_empresa, id_recrutador
)
VALUES (
    1, NOW(), 0, 'Vaga para Desenvolvedor Backend (Sênior)', 1, 1
);

-- SKILLS - ID 1, 2, 3
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (1, NOW(), 0, 'Java', 'Linguagem');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (2, NOW(), 0, 'SQL', 'Banco de Dados');
INSERT INTO TB_ONEM_SKILL (id_skill, dt_criacao, deleted, nm_skill, categoria) VALUES (3, NOW(), 0, 'Spring', 'Framework');

-- VAGA_SKILL (Associação Vaga 1: Java, Spring)
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (1, 1);
INSERT INTO TB_ONEM_VAGA_SKILL (id_vaga, id_skill) VALUES (1, 3);

-- ============================================================================
-- DADOS DE PERFIL DO CANDIDATO 3 (PARA VISUALIZAÇÃO COMPLETA)
-- ============================================================================

-- 1. FORMAÇÕES (DETALHES)
-- FORMAÇÃO 1 - ID 1 (FK para Candidato 3)
INSERT INTO TB_ONEM_FORMACAO (
    id_formacao, dt_criacao, nm_formacao, ds_formacao, nm_instituicao, dt_inicio, dt_fim, id_candidato
)
VALUES (
    1, NOW(), 'Bacharelado em T.I.', 'Curso de 4 anos de sistemas de informação', 'Universidade FIAP', '2015-01-01 00:00:00', '2018-12-31 00:00:00', 3
);
-- FORMAÇÃO 2 - ID 2 (FK para Candidato 3)
INSERT INTO TB_ONEM_FORMACAO (
    id_formacao, dt_criacao, nm_formacao, ds_formacao, nm_instituicao, dt_inicio, dt_fim, id_candidato
)
VALUES (
    2, NOW(), 'Pós-Graduação em Software', 'Especialização em arquitetura de microsserviços', 'Alura', '2023-08-01 00:00:00', NULL, 3
);


-- 2. SKILLS (DETALHES)
-- CANDIDATO_SKILL (Associação Candidato 3: SQL, Java, Spring)
INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 2); -- SQL
INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 1); -- Java
INSERT INTO TB_ONEM_CANDIDATO_SKILL (id_candidato, id_skill) VALUES (3, 3); -- Spring


-- 3. CANDIDATURA (DETALHES)
-- CANDIDATURA - ID 1 (FK para Candidato 3 e Vaga 1)
INSERT INTO TB_ONEM_CANDIDATURA (
    id_candidatura, dt_criacao, deleted, id_vaga, id_candidato
)
VALUES (
    1, NOW(), 0, 1, 3
);

-- STATUS_CANDIDATURA (HISTÓRICO)
-- STATUS 1 - ID 1 (FK para Candidatura 1)
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (
    id_status_candidatura, dt_atualizacao, ds_status, id_candidatura
)
VALUES (
    1, NOW(), 'CANDIDATURA_REALIZADA', 1
);
-- STATUS 2 - ID 2 (FK para Candidatura 1)
INSERT INTO TB_ONEM_STATUS_CANDIDATURA (
    id_status_candidatura, dt_atualizacao, ds_status, id_candidatura
)
VALUES (
    2, DATEADD('HOUR', 1, NOW()), 'AGUARDANDO_TESTE', 1
);


-- ============================================================================
-- DADOS DE TESTE
-- ============================================================================

-- TESTE - ID 1 (FK para Vaga 1)
INSERT INTO TB_ONEM_TESTE (
    id_teste, dt_inicio, dt_fim, pontuacao_teste, id_vaga
)
VALUES (
    1, NOW(), DATEADD('DAY', 7, NOW()), 0.0, 1
);

-- QUESTÃO - ID 1
INSERT INTO TB_ONEM_QUESTAO (
    id_questao, nv_dificuldade, enunciado_questao, alternativa_1, alternativa_2
)
VALUES (
    1, 2, 'O que é ORM?', 'Object Relational Mapping', 'Open Real Machine'
);

-- TESTE_QUESTAO (Associação Teste 1: Questão 1 - FAZENDO A LIGAÇÃO N:M)
INSERT INTO TB_ONEM_TESTE_QUESTAO (id_teste, id_questao) VALUES (1, 1);

-- ============================================================================
-- REINICIA SEQUÊNCIAS PARA NOVAS INSERÇÕES
-- ============================================================================
ALTER TABLE TB_ONEM_CANDIDATO ALTER COLUMN ID_CANDIDATO RESTART WITH 4;
ALTER TABLE TB_ONEM_EMPRESA ALTER COLUMN ID_EMPRESA RESTART WITH 2;
ALTER TABLE TB_ONEM_RECRUTADOR ALTER COLUMN ID_RECRUTADOR RESTART WITH 2;
ALTER TABLE TB_ONEM_VAGA ALTER COLUMN ID_VAGA RESTART WITH 2;
ALTER TABLE TB_ONEM_SKILL ALTER COLUMN ID_SKILL RESTART WITH 4;
ALTER TABLE TB_ONEM_FORMACAO ALTER COLUMN ID_FORMACAO RESTART WITH 3; -- ID 2 foi usado
ALTER TABLE TB_ONEM_CANDIDATURA ALTER COLUMN ID_CANDIDATURA RESTART WITH 2;
ALTER TABLE TB_ONEM_STATUS_CANDIDATURA ALTER COLUMN ID_STATUS_CANDIDATURA RESTART WITH 3; -- ID 2 foi usado
ALTER TABLE TB_ONEM_TESTE ALTER COLUMN ID_TESTE RESTART WITH 2;
ALTER TABLE TB_ONEM_QUESTAO ALTER COLUMN ID_QUESTAO RESTART WITH 2;