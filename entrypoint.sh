#!/bin/sh
set -e

# Start the main server in the background
/app/bin/pointercrate-example &

# Wait for the server to become ready (adjust duration as needed)
echo "Waiting for server to become ready..."
sleep 10

# Run the migration script (ignore failure if already applied)
echo "Running data migration..."
/app/bin/trlist-pointercrate-migration || echo "Migration failed or already applied"

# Wait for the server process so container stays alive
wait %1
