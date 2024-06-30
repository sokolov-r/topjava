DELETE
FROM user_role;
DELETE
FROM meals;
DELETE
FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password)
VALUES ('User', 'user@yandex.ru', 'password'),
       ('Admin', 'admin@gmail.com', 'admin'),
       ('Guest', 'guest@gmail.com', 'guest');

INSERT INTO user_role (role, user_id)
VALUES ('USER', 100000),
       ('ADMIN', 100001);

INSERT INTO meals (user_id, date_time, description, calories)
VALUES (100001, '2024-06-26 08:00:00+01', 'admin breakfast', 300),
       (100001, '2024-06-26 12:00:00+01', 'admin lunch', 500),
       (100000, '2024-06-26 18:00:00+01', 'user dinner', 300),
       (100000, '2024-06-26 07:00:00+01', 'user breakfast', 300),
       (100000, '2024-06-26 11:00:00+01', 'user lunch', 500),
       (100001, '2024-06-26 17:00:00+01', 'admin dinner', 300),
       (100001, '2024-05-26 08:00:00+01', 'admin breakfast', 300),
       (100001, '2024-05-26 12:00:00+01', 'admin lunch', 500),
       (100000, '2024-05-26 18:00:00+01', 'user dinner', 300),
       (100000, '2024-05-26 07:00:00+01', 'user breakfast', 2000),
       (100000, '2024-05-26 11:00:00+01', 'user lunch', 500),
       (100001, '2024-05-26 17:00:00+01', 'admin dinner', 300);