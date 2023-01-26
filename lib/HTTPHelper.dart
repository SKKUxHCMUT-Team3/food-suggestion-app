import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPHelper {
  Future<String> addFood() async {
    Map<String, String> data = {
      'food': 'pizza',
      'ingredient': 'cheese',
    };
    // 1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp

    // 2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.

    // 3- Find '--disable-extensions'

    // 4- Add '--disable-web-security'

    final response = await http.post(Uri.http("127.0.0.1:5000", '/findSimilar'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "An Error Occurred: ${response.statusCode} ${response.reasonPhrase}";
    }
  }
}
