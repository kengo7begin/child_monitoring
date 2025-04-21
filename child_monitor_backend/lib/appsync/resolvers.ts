import * as appsync from 'aws-cdk-lib/aws-appsync';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';

export const attachResolvers = (
    api: appsync.GraphqlApi,
    table: dynamodb.Table
) => {
    const dataSource = api.addDynamoDbDataSource("MetadataDS", table);

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
};
