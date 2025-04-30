import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:new_project/util/logger.dart';

class GraphQLQueries {
  Future<GraphQLResponse> getRaspiTable(String id) {
    final request = GraphQLRequest(
      document: r'''
        query GetRaspiTable($id: String!) {
          __typename
          getRaspiTable(id: $id) {
            __typename
            id
            detection
            status
          }
        }
      ''',
      variables: {
        'id': id,
      },
    );
    logger.info('getRaspiTable call');

    return Amplify.API.query(request: request).response;
  }

  Future<GraphQLResponse> listPictureMetadata(int? limit, String? nextToken) {
    final request = GraphQLRequest(
      document: r'''
        query ListPictureMetadata($limit: Int, $nextToken: String) {
          __typename
          listPictureMetadata(limit: $limit, nextToken: $nextToken) {
            __typename
            items {
              __typename
              id
              key
              createdAt
            }
            nextToken
          }
        }
      ''',
      variables: {
        'limit': limit,
        'nextToken': nextToken,
      },
    );
    logger.info('listPictureMetadata call');

    return Amplify.API.query(request: request).response;
  }

  Future<GraphQLResponse> getSignedUrl(List<String> keys) {
    final request = GraphQLRequest(
      document: r'''
        query GetSignedUrl($keys: [String!]!) {
          __typename
          getSignedUrl(keys: $keys)
        }
      ''',
      variables: {
        'keys': keys,
      },
    );
    logger.info('getSignedUrl call');

    return Amplify.API.query(request: request).response;
  }
}
