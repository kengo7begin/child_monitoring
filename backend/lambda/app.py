import os
import boto3

def handler(event, context):
    # DynamoDBテーブル名を環境変数から取得
    table_name = os.environ['TABLE_NAME']
    
    # クエリパラメータからidを取得
    id = event['queryStringParameters']['id']
    
    # DynamoDBクライアントの初期化
    dynamodb = boto3.resource('dynamodb')
    
    # DynamoDBテーブルの取得
    table = dynamodb.Table(table_name)
    
    # テーブルから指定されたidのデータを取得
    response = table.get_item(Key={'id': int(id)})
    
    # レスポンスデータの作成
    if 'Item' in response:
        item = response['Item']
        user_name = item['userName']
        response_data = {
            'statusCode': 200,
            'body': f'ID: {id}, User Name: {user_name}'
        }
    else:
        response_data = {
            'statusCode': 404,
            'body': f'ID: {id} not found'
        }
    
    return response_data