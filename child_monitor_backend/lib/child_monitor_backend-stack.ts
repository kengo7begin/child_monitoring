import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import { createMetadataTable } from './dynamoDB/metadata_table';
import { createGraphqlApi } from './appsync/graphql_api';
import { attachResolvers } from './appsync/resolvers';
import { createS3EventHandlerLambda } from './lambda/s3_event_handler';
import { configureS3Notification } from './s3/backet_notification';

export class ChildMonitorBackendStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);
    const metadataTable = createMetadataTable(this);
    const api = createGraphqlApi(this);

    attachResolvers(api, metadataTable);

    const s3EventHandler = createS3EventHandlerLambda(this, api);
    configureS3Notification(this, s3EventHandler);
    s3EventHandler.addEnvironment("APPSYNC_API_URL", "https://cqw6ap65t5aznlpwgcngkgerv4.appsync-api.ap-northeast-1.amazonaws.com/graphql");
    s3EventHandler.addEnvironment("APPSYNC_API_KEY", "da2-5ui3d5erqvcdpoh75txx3y3iv4");

  }
}