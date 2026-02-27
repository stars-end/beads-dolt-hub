FROM dolthub/dolt-sql-server:latest

# Create data directory
RUN mkdir -p /data

# Expose MySQL port and remotesapi port
EXPOSE 3306 8080

WORKDIR /data

# Initialize database and start server
RUN dolt init beads_bd

# Start Dolt SQL server with remotesapi
CMD ["dolt", "sql-server", "--host", "0.0.0.0", "--port", "3306", "--remotesapi", "addr=0.0.0.0:8080", "--data-dir", "/data"]
