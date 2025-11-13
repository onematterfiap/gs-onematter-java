-- Usuários iniciais para teste (H2/MySQL compatível)
-- Senha padrão: 'senhaSegura123'
-- Hash BCrypt para 'senhaSegura123': $2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6

INSERT INTO TB_ONEM_CANDIDATO (id_usuario, dt_criacao, deleted, nm_usuario, ds_email, ds_senha_hash, tp_usuario)
VALUES (1, NOW(), 0, 'Administrador Inicial', 'admin@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'ADMIN');

INSERT INTO TB_ONEM_CANDIDATO (id_usuario, dt_criacao, deleted, nm_usuario, ds_email, ds_senha_hash, tp_usuario)
VALUES (2, NOW(), 0, 'Usuário Comum Teste', 'user@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER');

INSERT INTO TB_ONEM_CANDIDATO (id_usuario, dt_criacao, deleted, nm_usuario, ds_email, ds_senha_hash, tp_usuario)
VALUES (3, NOW(), 0, 'Candidato Teste', 'candidato@onematter.com', '$2a$10$6Ra0FhM5OIJ2RG8tfx3tWOtm0meVQsYbYr5CHra45/PMZkUGDMYN6', 'USER');

-- ============================================================================
-- FIX DE ID: Reinicia a sequência de ID após inserções manuais
-- (O ID 3 será o próximo a ser usado no endpoint /register)
-- ============================================================================
ALTER TABLE TB_ONEM_CANDIDATO ALTER COLUMN ID_USUARIO RESTART WITH 4;