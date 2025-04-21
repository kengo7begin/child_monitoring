import { Bucket, EventType } from "aws-cdk-lib/aws-s3";
import { IFunction } from "aws-cdk-lib/aws-lambda";
import { LambdaDestination } from "aws-cdk-lib/aws-s3-notifications";

export const configureS3Notification = (
    bucket: Bucket,
    lambdaFunction: IFunction
) => {
    bucket.addEventNotification(
        EventType.OBJECT_CREATED_PUT,
        new LambdaDestination(lambdaFunction)
    );
};
