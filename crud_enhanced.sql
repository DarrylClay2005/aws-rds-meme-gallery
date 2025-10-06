-- AWS RDS PostgreSQL CRUD Operations for Meme Gallery
-- This file contains sample Create, Read, Update, Delete operations

-- ===== CREATE (INSERT) OPERATIONS =====

-- Insert sample users
INSERT INTO users (username, password) VALUES 
('alice', 'password123'),
('bob', 'securepass456'),
('charlie', 'mypassword789');

-- Insert sample memes
INSERT INTO memes (title, url, user_id) VALUES 
('Distracted Boyfriend', 'https://i.imgur.com/example1.jpg', 1),
('Drake Pointing', 'https://i.imgur.com/example2.jpg', 1),
('Woman Yelling at Cat', 'https://i.imgur.com/example3.jpg', 2),
('This is Fine Dog', 'https://i.imgur.com/example4.jpg', 3);

-- ===== READ (SELECT) OPERATIONS =====

-- Read all users
SELECT * FROM users;

-- Read all memes
SELECT * FROM memes;

-- Read memes with user information (JOIN)
SELECT 
    m.id,
    m.title,
    m.url,
    u.username as creator,
    m.created_at
FROM memes m
JOIN users u ON m.user_id = u.id
ORDER BY m.created_at DESC;

-- Read memes by specific user
SELECT * FROM memes WHERE user_id = 1;

-- Count memes per user
SELECT 
    u.username,
    COUNT(m.id) as meme_count
FROM users u
LEFT JOIN memes m ON u.id = m.user_id
GROUP BY u.id, u.username
ORDER BY meme_count DESC;

-- ===== UPDATE OPERATIONS =====

-- Update a meme title
UPDATE memes 
SET title = 'Updated Distracted Boyfriend Meme' 
WHERE id = 1;

-- Update user password
UPDATE users 
SET password = 'newpassword123' 
WHERE username = 'alice';

-- Update meme URL
UPDATE memes 
SET url = 'https://i.imgur.com/updated-example1.jpg'
WHERE id = 1;

-- ===== DELETE OPERATIONS =====

-- Delete a specific meme
DELETE FROM memes WHERE id = 4;

-- Delete memes by a specific user (this will happen automatically due to CASCADE)
-- DELETE FROM users WHERE username = 'charlie';

-- ===== VERIFICATION QUERIES =====

-- Verify the updates and deletes
SELECT 'After updates and deletes:' as status;
SELECT * FROM users;
SELECT * FROM memes;

-- Final join query to see remaining data
SELECT 
    m.id as meme_id,
    m.title,
    m.url,
    u.username as creator,
    m.created_at
FROM memes m
JOIN users u ON m.user_id = u.id
ORDER BY m.id;