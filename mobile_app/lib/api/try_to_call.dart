import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getData() async {
  var response = await http.get(Uri.https(
    'p65d305bp9.execute-api.ap-northeast-1.amazonaws.com',
    '/dev',
  ));

  var jsonResponse = jsonDecode(response.body);

  print(jsonResponse);
}
