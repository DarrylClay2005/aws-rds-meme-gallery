-- AWS RDS PostgreSQL Schema for Meme Gallery
-- This file contains table definitions for users and memes

-- Create database (run this first when connecting to default postgres database)
-- CREATE DATABASE meme_gallery;
-- \c meme_gallery

-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Memes table with foreign key relationship to users
CREATE TABLE memes (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    url TEXT NOT NULL,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_memes_user_id ON memes(user_id);

-- Display table information
\d users
\d memes