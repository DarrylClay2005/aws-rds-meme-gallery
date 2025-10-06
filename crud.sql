-- Insert sample data as specified in assignment
INSERT INTO users (username, password)
VALUES ('alice', 'password123');

INSERT INTO memes (title, url, user_id)
VALUES ('Distracted Boyfriend', 'https://i.imgur.com/example1.jpg', 1);

-- Read all memes as specified in assignment
SELECT * FROM memes;

-- Update a meme as specified in assignment
UPDATE memes SET title = 'Updated Meme' WHERE id = 1;

-- Delete a meme as specified in assignment  
DELETE FROM memes WHERE id = 1;