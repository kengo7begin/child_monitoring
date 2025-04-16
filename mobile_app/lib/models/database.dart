import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_project/api/graphql/schema.graphql.dart';

part 'database.freezed.dart';

@freezed
class RapiTable with _$RapiTable {
  const factory RapiTable(
      {required String id,
      required bool detection,
      required RaspiStatus status}) = _RapiTable;
}

enum RaspiStatus { starting, active, stop, stopping }

RaspiStatus convertToStatus(Enum$RaspiStatus graphqlStatusEnum) {
  return switch (graphqlStatusEnum) {
    Enum$RaspiStatus.STARTING => RaspiStatus.starting,
    Enum$RaspiStatus.ACTIVE => RaspiStatus.active,
    Enum$RaspiStatus.STOP => RaspiStatus.stop,
    Enum$RaspiStatus.STOPPING => RaspiStatus.stopping,
    Enum$RaspiStatus.$unknown => RaspiStatus.stop,
  };
}
