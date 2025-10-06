-- Create a Users table as specified in assignment
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Create a Memes table with a foreign key as specified in assignment
CREATE TABLE memes (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  url TEXT NOT NULL,
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);