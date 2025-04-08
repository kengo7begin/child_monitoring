import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';

export class BackendStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const table = new dynamodb.Table(this, 'MyTable', {
      tableName: 'my_table',
      partitionKey: {
        name: 'id',
        type: dynamodb.AttributeType.NUMBER,
      },
    });


    // Lambda関数の作成
    const lambdaFunction = new lambda.Function(this, 'MyLambdaFunction', {
      runtime: lambda.Runtime.PYTHON_3_9,
      handler: 'app.handler',
      code: lambda.Code.fromAsset('lambda'),
      environment: {
        TABLE_NAME: table.tableName,
      },
    });

    // DynamoDBテーブルへのアクセスポリシーをLambda関数に追加
    table.grantReadData(lambdaFunction);

    // API Gatewayの作成
    const api = new apigateway.RestApi(this, 'MyApi', {
      restApiName: 'My API',
    });

    // API Gatewayのリソースと統合を作成
    const integration = new apigateway.LambdaIntegration(lambdaFunction);
    api.root.addMethod('GET', integration);
  }
}

