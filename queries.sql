# busca todas as informações (*) da tabela users
SELECT * FROM users;

# busca somente a coluna nome e email da tabela users
SELECT name, email from users

# realiza a inserção de 2 usuários na tabela, informando os campos de nome, email e senha
INSERT INTO users (name,email,password) VALUES ('Lerry', 'lerry.pirani@gmail.com', '123456');
INSERT INTO users (name,email,password) VALUES ('João', 'joao@gmail.com', '123456');

# busca todas as informações * na tabela usuarios onde a id corresponda a 2
SELECT * FROM users WHERE id = 2;

# busca todas as informações * na tabela usuários onde a id corresponda a 2 OU name corresponda a JOAO
SELECT * FROM users WHERE id = 2 OR name = 'João';

# atualiza na tabela users a coluna NAME e a coluna PASSWORD com novos valores ONDE a id seja 1
UPDATE users SET name = 'João Gabriel', password = 'ABC123' WHERE id =3;

# APAGA na tabela de users onde o id seja igual a 2
DELETE FROM users WHERE id = 2;

SELECT * FROM news

INSERT INTO news (title, description, user_id) VALUES ("Notícia bombástica", "se chove a terra molha!!", 1);
INSERT INTO news (title, description, user_id) VALUES ("Notícia Quente", "Hoje fez 30 graus", 3);

UPDATE news SET title = "Notícia da Chuva" WHERE id = 1 AND user_id =1;

SELECT * FROM news WHERE user_id = 1;

# titulo noticia, descrição noticia, dt atualização noticia, nome do usuário que incluiu a noticia
SELECT
	n.title as "Título",
    n.description as "Descrição",
    n.updated_at as "Ultima atualização",
    u.name as "Autor"
FROM news n
INNER JOIN users u on u.id = n.user_id
WHERE u.name like "João%"
AND n.id = 4;

SELECT
	n.title as "Título",
    n.description as "Descrição",
    n.updated_at as "Ultima atualização",
    u.name as "Autor"
FROM news n
INNER JOIN users u on u.id = n.user_id
ORDER BY n.updated_at DESC;

SELECT * FROM news LIMIT 2;

SELECT * FROM users;

UPDATE users SET is_active = 0 WHERE id = 2;