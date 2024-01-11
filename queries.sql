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