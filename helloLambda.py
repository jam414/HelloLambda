import json
import boto3
import os

def lambda_handler(event, context):
    # TODO implement
    print(event)
    print(context)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
