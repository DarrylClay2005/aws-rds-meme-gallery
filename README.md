# AWS RDS PostgreSQL Meme Gallery Database

This project creates a PostgreSQL database on AWS RDS for managing users and memes, demonstrating basic CRUD operations.

## Project Structure

```
aws-rds-meme-gallery/
├── README.md          # This file
├── schema.sql         # Database schema (CREATE TABLE statements)
├── crud.sql          # Sample CRUD operations
└── screenshots/      # Screenshots of database operations (to be added)
```

## AWS RDS Setup Instructions

### Step 1: Create PostgreSQL RDS Instance

1. **Login to AWS Console**
   - Go to [AWS Console](https://console.aws.amazon.com/)
   - Navigate to RDS service

2. **Create Database**
   - Click "Create database"
   - Choose "Standard Create"
   - Select "PostgreSQL" as engine

3. **Configuration Settings**
   - **Engine Version**: Use latest (PostgreSQL 15 or newer)
   - **Templates**: Free tier (if available)
   - **DB Instance Identifier**: `meme-gallery-db`
   - **Master Username**: `postgres`
   - **Master Password**: Choose a secure password (save this!)

4. **Instance Configuration**
   - **DB Instance Class**: `db.t3.micro` (free tier eligible)
   - **Storage**: 20 GB GP2 SSD (minimum)
   - **Enable storage autoscaling**: Yes

5. **Connectivity Settings**
   - **VPC**: Default VPC
   - **Subnet Group**: Default
   - **Public Access**: **YES** (for development/testing only)
   - **VPC Security Group**: Create new security group
   - **Database Port**: 5432

6. **Database Authentication**
   - Choose "Password authentication"

7. **Additional Configuration**
   - **Initial Database Name**: `postgres` (default)
   - **Backup**: Enable automatic backups
   - **Monitoring**: Enable Enhanced Monitoring (optional)

8. **Create Database**
   - Review settings and click "Create database"
   - Wait 10-15 minutes for creation to complete

### Step 2: Configure Security Group

1. **Find your RDS instance** and note the security group
2. **Edit Security Group Rules**:
   - Type: PostgreSQL
   - Protocol: TCP
   - Port Range: 5432
   - Source: Your IP address (or 0.0.0.0/0 for testing only)

### Step 3: Get Connection Details

After your RDS instance is ready:
- **Endpoint**: Copy the endpoint URL (e.g., `meme-gallery-db.abc123.us-west-2.rds.amazonaws.com`)
- **Port**: 5432
- **Username**: postgres
- **Password**: (the one you set)

## Local Setup and Connection

### Prerequisites

- PostgreSQL client tools installed (`psql`)
- AWS RDS instance running and accessible

### Connect to Database

```bash
# Replace <your-endpoint> with your actual RDS endpoint
psql -h <your-endpoint> -U postgres -d postgres -p 5432
```

Example:
```bash
psql -h meme-gallery-db.abc123.us-west-2.rds.amazonaws.com -U postgres -d postgres -p 5432
```

### Setup Database Schema

1. **Create the meme_gallery database**:
```sql
CREATE DATABASE meme_gallery;
\c meme_gallery
```

2. **Run the schema creation**:
```bash
# From your local machine
psql -h <your-endpoint> -U postgres -d meme_gallery -p 5432 -f schema.sql
```

3. **Run CRUD operations**:
```bash
psql -h <your-endpoint> -U postgres -d meme_gallery -p 5432 -f crud.sql
```

## Database Schema

### Users Table
- `id`: Primary key (SERIAL)
- `username`: Unique username (VARCHAR 50)
- `password`: User password (VARCHAR 255)
- `created_at`: Timestamp when user was created

### Memes Table
- `id`: Primary key (SERIAL)
- `title`: Meme title (VARCHAR 100)
- `url`: Meme image URL (TEXT)
- `user_id`: Foreign key to users table
- `created_at`: Timestamp when meme was created

## Sample CRUD Operations

The `crud.sql` file includes:

### CREATE Operations
- Insert sample users (alice, bob, charlie)
- Insert sample memes with relationships

### READ Operations
- Select all users and memes
- JOIN queries to show memes with creator names
- Aggregate queries (count memes per user)

### UPDATE Operations
- Update meme titles and URLs
- Update user passwords

### DELETE Operations
- Delete specific memes
- Demonstrate CASCADE deletes

## Testing Your Setup

1. **Verify Tables**:
```sql
\dt
\d users
\d memes
```

2. **Test Basic Queries**:
```sql
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM memes;
```

3. **Test Relationships**:
```sql
SELECT m.title, u.username 
FROM memes m 
JOIN users u ON m.user_id = u.id;
```

## Important Security Notes

⚠️ **For Production**:
- Never enable public access for production databases
- Use private subnets and VPC endpoints
- Implement proper IAM roles and policies
- Use SSL/TLS connections
- Store passwords securely (not in plain text)

## RDS Instance Details

**Your RDS Endpoint**: `database-2.cluster-ccr8se2ccd1w.us-east-1.rds.amazonaws.com`
**Database Name**: `meme_gallery`
**Username**: `postgres`
**Port**: `5432`

## Troubleshooting

### Common Connection Issues

1. **Timeout errors**: Check security group allows your IP on port 5432
2. **Authentication failed**: Verify username/password
3. **Host not found**: Ensure RDS endpoint is correct and instance is running
4. **Permission denied**: Make sure public access is enabled (for testing)

### Useful Commands

```bash
# Test connection
psql -h <endpoint> -U postgres -d postgres -p 5432 -c "SELECT version();"

# List databases
psql -h <endpoint> -U postgres -d postgres -p 5432 -c "\l"

# Connect with SSL (recommended)
psql -h <endpoint> -U postgres -d postgres -p 5432 "sslmode=require"
```

## Assignment Deliverables Checklist

- [x] SQL file (schema.sql) with CREATE TABLE statements
- [x] SQL file (crud.sql) with sample CRUD operations  
- [ ] Screenshots of successful queries against AWS RDS
- [ ] RDS endpoint documented in this README
- [ ] Repository pushed to GitHub

## Next Steps

1. Create your AWS RDS instance following the instructions above
2. Update the RDS endpoint in this README
3. Test the connection and run the SQL files
4. Take screenshots of your successful database operations
5. Add screenshots to the `screenshots/` directory
6. Commit and push to GitHub