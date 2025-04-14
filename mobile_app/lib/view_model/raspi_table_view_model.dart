import 'dart:async';

import 'package:new_project/models/database.dart';
import 'package:new_project/repositories/raspi_table.dart';
import 'package:new_project/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'raspi_table_view_model.g.dart';

@riverpod
class RaspiTableViewModel extends _$RaspiTableViewModel {
  @override
  Future<RapiTable> build(String id) async {
    final raspiTable =
        await ref.watch(raspiTableRepositoryProvider).getRaspiTable(id);

    final onRaspiTableSubscription =
        ref.read(raspiTableRepositoryProvider).onRaspiTable(id).listen(
      null,
      onError: (error, stackTrace) {
        logger.severe(
          'RaspiTableViewModel: onRaspiTableSubscription subscription errored',
          error: error,
          stackTrace: stackTrace,
        );
      },
      onDone: () {
        logger.info(
          'RaspiTableViewModel: onRaspiTableSubscription subscription closed',
        );
      },
    );

    onRaspiTableSubscription.onData((data) async {
      state = AsyncData(data);
    });
    return raspiTable;
  }
}
