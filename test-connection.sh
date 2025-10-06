#!/bin/bash

# AWS RDS PostgreSQL Connection Test Script
# Usage: ./test-connection.sh <rds-endpoint>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <rds-endpoint>"
    echo "Example: $0 meme-gallery-db.abc123.us-west-2.rds.amazonaws.com"
    exit 1
fi

RDS_ENDPOINT=$1
USERNAME="postgres"
PORT="5432"
DATABASE="postgres"

echo "Testing connection to AWS RDS PostgreSQL..."
echo "Endpoint: $RDS_ENDPOINT"
echo "Username: $USERNAME"
echo "Port: $PORT"
echo "Database: $DATABASE"
echo "=================================="

# Test basic connection
echo "1. Testing basic connection..."
psql -h "$RDS_ENDPOINT" -U "$USERNAME" -d "$DATABASE" -p "$PORT" -c "SELECT version();"

if [ $? -eq 0 ]; then
    echo "✅ Connection successful!"
    
    echo ""
    echo "2. Testing database creation..."
    psql -h "$RDS_ENDPOINT" -U "$USERNAME" -d "$DATABASE" -p "$PORT" -c "CREATE DATABASE IF NOT EXISTS meme_gallery;"
    
    echo ""
    echo "3. Listing databases..."
    psql -h "$RDS_ENDPOINT" -U "$USERNAME" -d "$DATABASE" -p "$PORT" -c "\l"
    
    echo ""
    echo "Ready to run schema and CRUD scripts!"
    echo "Next steps:"
    echo "1. psql -h $RDS_ENDPOINT -U $USERNAME -d meme_gallery -p $PORT -f schema.sql"
    echo "2. psql -h $RDS_ENDPOINT -U $USERNAME -d meme_gallery -p $PORT -f crud.sql"
else
    echo "❌ Connection failed!"
    echo "Check the following:"
    echo "- RDS endpoint is correct"
    echo "- Security group allows your IP on port 5432"
    echo "- RDS instance is running and available"
    echo "- Username and password are correct"
fi