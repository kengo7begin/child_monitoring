import { Construct } from 'constructs';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';

export const createPictureMetadataTable = (scope: Construct) => {
    const table = new dynamodb.Table(scope, "PictureMetadataTableDB", {
        partitionKey: { name: "id", type: dynamodb.AttributeType.STRING },
        billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
    });

    // GSI for listing by createdAt
    table.addGlobalSecondaryIndex({
        indexName: "createdAtIndex",
        partitionKey: { name: "bucket", type: dynamodb.AttributeType.STRING }, // 固定値でもOK
        sortKey: { name: "createdAt", type: dynamodb.AttributeType.STRING },
        projectionType: dynamodb.ProjectionType.ALL,
    });

    return table;
};
