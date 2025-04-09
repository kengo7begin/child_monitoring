import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:new_project/api/amplify/ammplify_config.dart';
import 'package:new_project/util/logger.dart';

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugins([AmplifyAPI()]);
    await Amplify.configure(amplifyConfig);
    logger.info('Amplify configured.');
  } catch (error, stack) {
    logger.severe(error);
    logger.severe(stack);
  }
}
