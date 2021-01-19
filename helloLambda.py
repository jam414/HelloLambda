import json
import boto3
import os

def lambda_handler(event, context):
    # TODO implement
    message = "<h1>Hello World !</h1>"
    return {
        'statusCode': 200,
        'body': message
    }
