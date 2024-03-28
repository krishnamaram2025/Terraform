import botocore
import boto3

def lambda_handler(event, context):
    client = boto3.client('rds', region_name='us-east-1')
    create_snap = client.create_db_snapshot(DBSnapshotIdentifier='rds-mysql-db-snapping06252021', DBInstanceIdentifier='mysqldb')
