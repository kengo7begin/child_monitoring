import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'RASPI_TABLE_ID')
  static const String raspiTableId = _Env.raspiTableId;
}
