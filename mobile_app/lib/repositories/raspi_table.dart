import 'dart:convert';

import 'package:new_project/api/graphql/query.dart';
import 'package:new_project/api/graphql/query.graphql.dart';
import 'package:new_project/api/graphql/subscription.dart';
import 'package:new_project/models/database.dart';
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

  Future<RapiTable> getRaspiTable(String id) async {
    final responseRaw = await _queries.getRaspiTable(id);
    if (responseRaw.hasErrors) {
      logger
          .severe(responseRaw.errors.map((error) => error.message).join('. '));
    }
    final responseJson = json.decode(responseRaw.data);
    final data = Query$GetRaspiTable.fromJson(responseJson);
    logger.info('getRaspiTable: get data');

    return RapiTable(
        id: data.getRaspiTable!.id,
        detection: data.getRaspiTable!.detection,
        status: convertToStatus(data.getRaspiTable!.status));
  }

  Stream<RapiTable> onRaspiTable(String id) {
    return _subscriptions.onRaspiTable(id).map((responseRaw) {
      if (responseRaw.hasErrors) {
        logger.severe(
            responseRaw.errors.map((error) => error.message).join('. '));
      }
      final responseJson = json.decode(responseRaw.data);
      logger.info('onRaspiTable: get new data');

      return RapiTable(
        id: responseJson['onRaspiTable']['id'],
        detection: responseJson['onRaspiTable']['detection'],
        status: switch (responseJson['onRaspiTable']['status']) {
          'STARTING' => RaspiStatus.starting,
          'ACTIVE' => RaspiStatus.active,
          'STOP' => RaspiStatus.stop,
          'STOPPING' => RaspiStatus.stopping,
          _ => RaspiStatus.stop,
        },
      );
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
