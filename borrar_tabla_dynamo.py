import boto3
from dotenv import load_dotenv
import os
from conexion_dynamo import conexion_dynamo

dynamodb = conexion_dynamo() 
load_dotenv()


dynamodb.delete_table(TableName='ejemplo_tabla_libros')
