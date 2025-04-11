import 'dart:convert';

import 'package:new_project/api/graphql/query.dart';
import 'package:new_project/api/graphql/query.graphql.dart';
import 'package:new_project/api/graphql/subscription.dart';
import 'package:new_project/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'raspi_table.g.dart';

class RaspiTableRepository {
  final GraphQLSubscription _subscriptions;
  final GraphQLQueries _queries;

  RaspiTableRepository(
    this._queries,
    this._subscriptions,
  );

  Future<Map> getRaspiTable(String id) async {
    final responseRaw = await _queries.getRaspiTable(id);
    if (responseRaw.hasErrors) {
      logger
          .severe(responseRaw.errors.map((error) => error.message).join('. '));
    }
    final responseJson = json.decode(responseRaw.data);
    final data = Query$GetRaspiTable.fromJson(responseJson);
    logger.info('getRaspiTable: get data');

    return {
      'id': data.getRaspiTable?.id,
      'detection': data.getRaspiTable?.detection,
      'status': data.getRaspiTable?.status
    };
  }

  Stream<Map> onRaspiTable(String id) {
    return _subscriptions.onRaspiTable(id).map((responseRaw) {
      if (responseRaw.hasErrors) {
        logger.severe(
            responseRaw.errors.map((error) => error.message).join('. '));
      }
      final responseJson = json.decode(responseRaw.data);
      logger.info('onRaspiTable: get new data');

      return {
        'id': responseJson['onRaspiTable']['id'],
        'detection': responseJson['onRaspiTable']['detection'],
        'status': responseJson['onRaspiTable']['status']
      };
    });
  }
}

@Riverpod(keepAlive: true)
RaspiTableRepository raspiTableRepository(RaspiTableRepositoryRef ref) {
  return RaspiTableRepository(
    GraphQLQueries(),
    GraphQLSubscription(),
  );
}
