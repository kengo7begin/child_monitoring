import * as appsync from 'aws-cdk-lib/aws-appsync';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';

export const attachResolvers = (
  api: appsync.GraphqlApi,
  table: dynamodb.Table
) => {
  const dataSource = api.addDynamoDbDataSource("PictureMetadataDS", table);

  dataSource.createResolver("addPictureMetadataResolver", {
    typeName: "Mutation",
    fieldName: "addPictureMetadata",
    requestMappingTemplate: appsync.MappingTemplate.fromString(`
      {
        "version": "2017-02-28",
        "operation": "PutItem",
        "key": {
          "id": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        },
        "attributeValues": {
          "bucket": $util.dynamodb.toDynamoDBJson("metadata"),
          "key": $util.dynamodb.toDynamoDBJson($ctx.args.key),
          "createdAt": $util.dynamodb.toDynamoDBJson($ctx.args.createdAt)
        }
      }
    `),
    responseMappingTemplate: appsync.MappingTemplate.fromString("$util.toJson($ctx.result)")
  });

  dataSource.createResolver("listPictureMetadataResolver", {
    typeName: "Query",
    fieldName: "listPictureMetadata",
    requestMappingTemplate: appsync.MappingTemplate.fromString(`
      {
        "version": "2017-02-28",
        "operation": "Query",
        "index": "createdAtIndex",
        "query": {
          "expression": "#b = :b",
          "expressionNames": {
            "#b": "bucket"
          },
          "expressionValues": {
            ":b": { "S": "metadata" }
          }
        },
        "scanIndexForward": false,
        "limit": $util.defaultIfNull($ctx.args.limit, 10),
        "nextToken": $util.toJson($ctx.args.nextToken)
      }
    `),
    responseMappingTemplate: appsync.MappingTemplate.fromString(`
      {
        "items": $util.toJson($ctx.result.items),
        "nextToken": $util.toJson($ctx.result.nextToken)
      }
    `)
  });
};

import * as lambda from 'aws-cdk-lib/aws-lambda';

export const addGetSignedUrlResolver = (
  api: appsync.GraphqlApi,
  lambdaFn: lambda.Function
) => {
  const lambdaDs = api.addLambdaDataSource('getSignedUrlDataSource', lambdaFn);

  lambdaDs.createResolver('getSignedUrlResolver', {
    typeName: 'Query',
    fieldName: 'getSignedUrl',
  });
};