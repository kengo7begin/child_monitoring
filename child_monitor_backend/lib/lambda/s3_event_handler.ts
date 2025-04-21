import * as path from "path";
import { Construct } from 'constructs';
import { NodejsFunction } from 'aws-cdk-lib/aws-lambda-nodejs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as iam from 'aws-cdk-lib/aws-iam';
import * as appsync from 'aws-cdk-lib/aws-appsync';

export const createS3EventHandlerLambda = (scope: Construct, api: appsync.GraphqlApi) => {
    const func = new NodejsFunction(scope, "s3EventHandler", {
        runtime: lambda.Runtime.NODEJS_20_X,
        entry: path.join(__dirname, "../../lambda/s3EventHandler.ts"),
        handler: "handler",
        functionName: "s3EventHandler",
        environment: {
            APPSYNC_API_URL: api.graphqlUrl,
            APPSYNC_API_KEY: api.apiKey || "",
        },
    });

    func.addToRolePolicy(
        new iam.PolicyStatement({
            actions: ["appsync:GraphQL"],
            resources: [api.arn + "/*"],
        })
    );

    return func;
};
