import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:new_project/util/logger.dart';

class GraphQLSubscription {
  Stream<GraphQLResponse> onRaspiTable(String id) {
    final request = GraphQLRequest(
      document: r'''
      subscription OnRaspiTable($id: String!) {
        onRaspiTable(id: $id)  {
          id
          detection
          status
        }
    }''',
      variables: {
        'id': id,
      },
    );

    logger.info('onRaspiTable call');

    return Amplify.API.subscribe(
      request,
      onEstablished: () {
        logger.info('subscription: onRaspiTable is established');
      },
    );
  }
}
