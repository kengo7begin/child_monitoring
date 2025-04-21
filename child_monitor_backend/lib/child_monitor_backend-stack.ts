import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';
import * as appsync from 'aws-cdk-lib/aws-appsync';
import * as iam from 'aws-cdk-lib/aws-iam';
import * as path from "path";
import { Bucket, EventType } from 'aws-cdk-lib/aws-s3';
import { LambdaDestination } from 'aws-cdk-lib/aws-s3-notifications';
import { NodejsFunction } from "aws-cdk-lib/aws-lambda-nodejs";

export class ChildMonitorBackendStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);


    // ✅ 1. DynamoDB
    const metadataTable = new dynamodb.Table(this, "MetadataTable", {
      partitionKey: { name: "id", type: dynamodb.AttributeType.STRING },
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
    });

    // ✅ 2. AppSync API
    const api = new appsync.GraphqlApi(this, "ChildMonitorApi", {
      name: "ChildMonitorApi",
      schema: appsync.SchemaFile.fromAsset("graphql/schema.graphql"),
      authorizationConfig: {
        defaultAuthorization: {
          authorizationType: appsync.AuthorizationType.API_KEY,
        },
      },
      xrayEnabled: true,
    });


    // ✅ 3. AppSync ↔ DynamoDB
    const dataSource = api.addDynamoDbDataSource("MetadataDS", metadataTable);

    dataSource.createResolver("addMetadataResolver", {
      typeName: "Mutation",
      fieldName: "addMetadata",
      requestMappingTemplate: appsync.MappingTemplate.fromString(`
        {
          "version": "2017-02-28",
          "operation": "PutItem",
          "key": {
            "id": $util.dynamodb.toDynamoDBJson($ctx.args.id)
          },
          "attributeValues": {
            "bucket": $util.dynamodb.toDynamoDBJson($ctx.args.bucket),
            "key": $util.dynamodb.toDynamoDBJson($ctx.args.key),
            "createdAt": $util.dynamodb.toDynamoDBJson($ctx.args.createdAt)
          }
        }
      `),
      responseMappingTemplate: appsync.MappingTemplate.fromString("$util.toJson($ctx.result)"),
    });

    // Define the Lambda function resource
    const s3EventHandler = new NodejsFunction(this, "s3EventHandler", {
      runtime: lambda.Runtime.NODEJS_20_X,
      entry: path.join(__dirname, "../lambda/s3EventHandler.ts"),
      handler: "handler",
      functionName: "s3EventHandler",
      environment: {
        GRAPHQL_API_URL: api.graphqlUrl,
        GRAPHQL_API_KEY: api.apiKey || "",
      },
    });

    // ✅ 5. Lambda に権限付与（AppSync 呼び出し）
    s3EventHandler.addToRolePolicy(
      new iam.PolicyStatement({
        actions: ["appsync:GraphQL"],
        resources: [api.arn + "/*"],
      })
    );

    s3EventHandler.addEnvironment("APPSYNC_API_URL", "https://xfxjvx2oy5aoxj37mxnoqlnloe.appsync-api.ap-northeast-1.amazonaws.com/graphql");
    s3EventHandler.addEnvironment("APPSYNC_API_KEY", "da2-zddawr7cfzaqdifhpybzrl2nga");


    // 既存のS3バケットを取得
    const existing_bucket = Bucket.fromBucketArn(
      this,
      '20250414-raspi-camera',
      'arn:aws:s3:::20250414-raspi-camera'
    )

    // S3Notificationを設定
    existing_bucket.addEventNotification(
      EventType.OBJECT_CREATED_PUT,
      new LambdaDestination(s3EventHandler)
    )
  }
}