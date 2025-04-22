import 'dart:convert';
import 'package:new_project/api/graphql/query.dart';
import 'package:new_project/api/graphql/query.graphql.dart';
import 'package:new_project/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pictures.g.dart';

class PicturesRepository {
  final GraphQLQueries _queries;

  PicturesRepository(
    this._queries,
  );

  Future<List<String>> getSignedUrl(List<String> keys) async {
    final responseRaw = await _queries.getSignedUrl(keys);
    if (responseRaw.hasErrors) {
      logger
          .severe(responseRaw.errors.map((error) => error.message).join('. '));
    }
    final responseJson = json.decode(responseRaw.data) as Map<String, dynamic>;

    final data = Query$GetSignedUrl.fromJson(responseJson);
    logger.info('getSignedUrl: get data');

    return data.getSignedUrl;
  }
}

@Riverpod(keepAlive: true)
PicturesRepository picturesRepository(PicturesRepositoryRef ref) {
  return PicturesRepository(
    GraphQLQueries(),
  );
}
