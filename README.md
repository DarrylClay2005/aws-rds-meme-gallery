# AWS RDS PostgreSQL Meme Gallery

PostgreSQL database on AWS RDS demonstrating basic CRUD operations with users and memes tables.

## Files

- `schema.sql` - Database table definitions
- `crud.sql` - Sample CRUD operations
- `screenshots/` - Database operation screenshots

## Database Schema

**Users Table:**
- `id` (SERIAL PRIMARY KEY)
- `username` (VARCHAR(50) UNIQUE NOT NULL)
- `password` (VARCHAR(255) NOT NULL)

**Memes Table:**
- `id` (SERIAL PRIMARY KEY)
- `title` (VARCHAR(100) NOT NULL)
- `url` (TEXT NOT NULL)
- `user_id` (INT REFERENCES users(id) ON DELETE CASCADE)

## Usage

1. Create database: `CREATE DATABASE meme_gallery;`
2. Run schema: `psql -f schema.sql`
3. Run CRUD operations: `psql -f crud.sql`

## RDS Details

**Endpoint:** `database-2.cluster-ccr8se2ccd1w.us-east-1.rds.amazonaws.com`  
**Database:** `meme_gallery`  
**Username:** `postgres`  
**Port:** `5432`
