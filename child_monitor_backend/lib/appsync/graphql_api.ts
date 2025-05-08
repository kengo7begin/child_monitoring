import * as cognito from 'aws-cdk-lib/aws-cognito';
import * as appsync from 'aws-cdk-lib/aws-appsync';
import { Construct } from 'constructs';

export const createGraphqlApi = (scope: Construct) => {
    const userPool = cognito.UserPool.fromUserPoolId(
        scope,
        'child-monitoring-app',
        'ap-northeast-1_KnRu3tBnu'
    );
    return new appsync.GraphqlApi(scope, "ChildMonitorApi", {
        name: "ChildMonitorApi",
        schema: appsync.SchemaFile.fromAsset("graphql/schema.graphql"),
        authorizationConfig: {
            defaultAuthorization: {
                authorizationType: appsync.AuthorizationType.USER_POOL,
                userPoolConfig: {
                    userPool
                },
            },
            additionalAuthorizationModes: [
                {
                    authorizationType: appsync.AuthorizationType.IAM,
                },
            ],
        },
        xrayEnabled: true,
    });
};
