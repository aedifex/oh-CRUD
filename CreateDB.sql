CREATE DATABASE api;

CREATE TABLE users (
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(30)
);

INSERT INTO users (name, email) VALUES ('Jerry', 'jerry@example.com'), ('George', 'george@example.com');


INSERT INTO users (name, email) VALUES ('Daniel', 'daniel@example.com'), ('Mike', 'mike@example.com');