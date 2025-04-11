// import 'package:amplify_api/amplify_api.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:new_project/models/database.dart';
// import 'package:new_project/util/logger.dart';

// class GraphQLMutations {
//   Future<GraphQLResponse> getRaspiTable(DatabaseModel input) {
//     final request = GraphQLRequest(
//       document: r'''
//         query GetRaspiTable($id: String!) {
//           __typename
//           getRaspiTable(id: $id) {
//             __typename
//             id
//             detection
//             status
//           }
//         }
//       ''',
//       variables: {
//         'id': id,
//       },
//     );
//     logger.info('getRaspiTable call');

//     return Amplify.API.query(request: request).response;
//   }
// }
