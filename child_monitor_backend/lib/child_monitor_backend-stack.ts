import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import { Bucket, EventType } from 'aws-cdk-lib/aws-s3';
import { LambdaDestination } from 'aws-cdk-lib/aws-s3-notifications';

export class ChildMonitorBackendStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Define the Lambda function resource
    const s3EventHandler = new lambda.Function(this, "s3EventHandler", {
      runtime: lambda.Runtime.NODEJS_20_X,
      handler: "s3EventHandler.handler",
      functionName: "s3EventHandler",
      code: new lambda.AssetCode("lambda/dist"),
    });

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