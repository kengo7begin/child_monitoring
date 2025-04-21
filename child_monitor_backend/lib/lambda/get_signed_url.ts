import * as lambda from 'aws-cdk-lib/aws-lambda';
import { Construct } from 'constructs';
import * as path from 'path';
import { Bucket } from 'aws-cdk-lib/aws-s3';
import { NodejsFunction } from 'aws-cdk-lib/aws-lambda-nodejs';

export const createGetSignedUrlLambda = (scope: Construct, bucket: Bucket) => {
    const fn = new NodejsFunction(scope, "getSignedUrlLambda", {
        runtime: lambda.Runtime.NODEJS_20_X,
        entry: path.join(__dirname, "../../lambda/getSignedUrl.ts"),
        handler: "handler",
        functionName: "getSignedUrlLambda",
        environment: {
            BUCKET_NAME: bucket.bucketName,
        },
    });

    bucket.grantRead(fn);

    return fn;
};