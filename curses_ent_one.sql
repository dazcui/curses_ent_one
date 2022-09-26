CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar(150) NOT NULL,
  "email" varchar(150) UNIQUE NOT NULL,
  "password" varchar(30) NOT NULL,
  "age" int
);

CREATE TABLE "curses" (
  "id" uuid PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "descripcion" varchar(200) NOT NULL,
  "level" varchar(150) NOT NULL,
  "teacher" varchar(150),
  "user_id" uuid NOT NULL
);

CREATE TABLE "curse_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "url" varchar(150),
  "curse_id" uuid NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar(150) NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar(150) NOT NULL,
  "user_id" uuid NOT NULL
);

ALTER TABLE "roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "curses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "curse_videos" ADD FOREIGN KEY ("curse_id") REFERENCES "curses" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- //registro de usuarios
insert into users (
id,
name,
email,
password,
age
)values(
'd5813cdd-c519-4e21-af46-c03a15a6e352',
'David',
'david@gmail.com',
'123',
45
),
(
'c62e8f24-b62a-4783-869d-8a03d82b50ed',
'Pedro',
'pedro@gmail.com',
'234',
22
);

-- //Introduccion de cursos para dos estudiantes
insert into curses (
id,
title,
descripcion,
level,
teacher,
user_id
)values(
'6fda9821-53ff-4518-be14-b87db2a6574e',
'Fundamentos',
'obtendrá las habilidades necesarias para desarrollar de manera correcta la parte visual de un sitio web responsivo sin utilizar librerías/frameworks',
'Principiante',
'Brayan Munoz',
'd5813cdd-c519-4e21-af46-c03a15a6e352'
),
(
'446d8b56-bd9b-43d2-ad3c-28980c90c313',
'React',
'El estudiante aprenderá a crear aplicaciones web con React JS, logrando una gran interacción con el usuario usando los conocimientos previos de HTML, CSS y Javascript.',
'Intermedio',
'Benjamin Flores',
'c62e8f24-b62a-4783-869d-8a03d82b50ed'
);
-- //cursos con videos
insert into curse_videos(
id,
title,
url,
curse_id
)values(
'18866530-e544-43cf-8525-b444c7f03a42',
'Phyton',
'https://class-center.academlo.com/',
'6fda9821-53ff-4518-be14-b87db2a6574e'
),
(
'4a1e0583-74cb-480a-9fd9-606bc717127a',
'C#',
'https://google.com',
'446d8b56-bd9b-43d2-ad3c-28980c90c313'
);
-- // categorias de los cursos
insert into categories(
id,
name,
user_id  
)values(
'7a1d365e-7a00-4fa0-8883-5bd98c198cd8',
'Avanzado',
'd5813cdd-c519-4e21-af46-c03a15a6e352'
),(
'cdae1b67-8b07-4d3c-b8f4-282c21bb5d4e',
'Intermedio',
'c62e8f24-b62a-4783-869d-8a03d82b50ed'
);
-- // determina si es estudiante o administrador o profesor
insert into roles(
id,
name,
user_id 
)values(
'a6ae7d63-7bcf-4dda-af16-88b69e3b3509',
'Student',
'd5813cdd-c519-4e21-af46-c03a15a6e352'
),
(
'9ed16be4-f842-4a37-ab51-496419f0576c',
'teacher',
'c62e8f24-b62a-4783-869d-8a03d82b50ed'
);


select * from users;
select * from roles;
select * from curses;
select * from categories;
select * from curse_videos;
select * from curses c join curse_videos v on c.id = v.curse_id;