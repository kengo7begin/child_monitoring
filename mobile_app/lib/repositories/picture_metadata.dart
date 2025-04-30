import 'dart:convert';

import 'package:new_project/api/graphql/query.dart';
import 'package:new_project/api/graphql/query.graphql.dart';
import 'package:new_project/api/graphql/subscription.dart';
import 'package:new_project/models/picture_metadata.dart';
import 'package:new_project/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'picture_metadata.g.dart';

class PictureMetadataRepository {
  final GraphQLQueries _queries;
  final GraphQLSubscription _subscriptions;

  PictureMetadataRepository(
    this._queries,
    this._subscriptions,
  );

  Future<PictureMetadataConnection> listPictureMetadata(
      int? limit, String? nextToken) async {
    final responseRaw = await _queries.listPictureMetadata(limit, nextToken);
    if (responseRaw.hasErrors) {
      logger
          .severe(responseRaw.errors.map((error) => error.message).join('. '));
    }
    final responseJson = json.decode(responseRaw.data);
    final data = Query$ListPictureMetadata.fromJson(responseJson);
    logger.info('listPictureMetadata: get data');

    final items = data.listPictureMetadata?.items ?? [];
    return PictureMetadataConnection(
        items: items
            .map((item) => PictureMetadata(
                  id: item.id,
                  key: item.key,
                  createdAt: item.createdAt,
                ))
            .toList(),
        nextToken: data.listPictureMetadata?.nextToken);
  }

  Stream<PictureMetadata> onAddPictureMetadata() {
    return _subscriptions.onAddPictureMetadata().map((responseRaw) {
      if (responseRaw.hasErrors) {
        logger.severe(
            responseRaw.errors.map((error) => error.message).join('. '));
      }
      final responseJson = json.decode(responseRaw.data);
      logger.info('onRaspiTable: get new data');

      return PictureMetadata(
          id: responseJson['onAddPictureMetadata']['id'],
          key: responseJson['onAddPictureMetadata']['key'],
          createdAt: responseJson['onAddPictureMetadata']['createdAt']);
    });
  }
}

@Riverpod(keepAlive: true)
PictureMetadataRepository pictureMetadataRepository(
    PictureMetadataRepositoryRef ref) {
  return PictureMetadataRepository(
    GraphQLQueries(),
    GraphQLSubscription(),
  );
}
