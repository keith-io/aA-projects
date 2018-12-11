PRAGMA foreign_Keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id) 
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id),
  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('John', 'Kim'),
  ('Keith', 'IO'),
  ('Oscar', 'Alvarez');

INSERT INTO 
  questions (title, body, author_id)
VALUES
  ('Why', 'Is SQL so EASY?', 2),
  ('Lunch', 'Is it time yet?', 3),
  ('Homework', 'Why so much?', 1);

INSERT INTO 
  question_follows (user_id, question_id)
VALUES 
  (1, 2),
  (3, 2),
  (1, 3),
  (3, 1),
  (2, 1);

INSERT INTO 
  replies (body, question_id, parent_id, author_id)
VALUES
  ('I dunno', 2, null, 3),
  ('Drink more water', 3, null, 1),
  ('No', 1, null, 3),
  ('Yes', 1, 3, 3);

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (2, 1);
