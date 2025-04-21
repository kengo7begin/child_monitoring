import { Construct } from "constructs";
import { Bucket, EventType } from "aws-cdk-lib/aws-s3";
import { IFunction } from "aws-cdk-lib/aws-lambda";
import { LambdaDestination } from "aws-cdk-lib/aws-s3-notifications";

export const configureS3Notification = (
    scope: Construct,
    lambdaFunction: IFunction
) => {
    const bucket = Bucket.fromBucketArn(
        scope,
        "RaspiCameraBucket",
        "arn:aws:s3:::20250414-raspi-camera"
    );

    bucket.addEventNotification(
        EventType.OBJECT_CREATED_PUT,
        new LambdaDestination(lambdaFunction)
    );
};
