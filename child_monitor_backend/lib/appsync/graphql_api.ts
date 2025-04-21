import * as appsync from 'aws-cdk-lib/aws-appsync';
import { Construct } from 'constructs';

export const createGraphqlApi = (scope: Construct) => {
    return new appsync.GraphqlApi(scope, "ChildMonitorApi", {
        name: "ChildMonitorApi",
        schema: appsync.SchemaFile.fromAsset("graphql/schema.graphql"),
        authorizationConfig: {
            defaultAuthorization: {
                authorizationType: appsync.AuthorizationType.API_KEY,
            },
        },
        xrayEnabled: true,
    });
};
