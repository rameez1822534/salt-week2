import psycopg2
from .config import config

def connect():
    conn = None
    try:
        params = config()
        print("Connecting to the PostgreSQL database...")
        conn = psycopg2.connect(**params)
        print("Connection successful.")

        # You can optionally test with a query here
        cur = conn.cursor()
        cur.execute("SELECT version();")
        db_version = cur.fetchone()
        print(f"PostgreSQL version: {db_version}")

        cur.close()
    except Exception as error:
        print(f"Error: {error}")
    finally:
        if conn is not None:
            conn.close()
            print("Database connection closed.")
