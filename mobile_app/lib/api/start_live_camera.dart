import 'package:http/http.dart' as http;

Future<String> startLiveCamera() async {
  var response = await http.get(Uri.https(
      '2ty3v8ae07.execute-api.ap-northeast-1.amazonaws.com',
      'dev//startLiveCamera'));

  print(response.statusCode);
  return response.statusCode.toString();
}
