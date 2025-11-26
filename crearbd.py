import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()


config = {
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "host": os.getenv("ENDPOINT")
   
}
DB_NAME = os.getenv("DB_NAME")
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor(dictionary=True)
cursor.execute(f"USE `{DB_NAME}`")

cursor.execute("SHOW DATABASES;")
print("\n📁 Bases de datos disponibles en tu RDS:")
for db in cursor:
    print(" -", db[0])

