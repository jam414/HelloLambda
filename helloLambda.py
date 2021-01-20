import json
import boto3
import os

def lambda_handler(event, context):
    # TODO implement
    message = "Hello World again!"
    return {
        'statusCode': 200,
        'body': message
    }
