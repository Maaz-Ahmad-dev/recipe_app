import 'dart:convert';

import 'package:http/http.dart' as http;

class ConstantFunctions {
  static Future<List<Map<String, dynamic>>> getResponse(String value) async {
    List<Map<String, dynamic>> recipe = [];
    String id = '8df4d003';
    String key = '34c9b4aca9d5150f2ab2dbcc897ce2df';
    String api =
        'https://api.edamam.com/search?q=$value&app_id=$id&app_key=$key&from=0&to=20&calories=591-722&health=alcohol-free';

    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['hits'] != null) {
        for (var index in data['hits']) {
          recipe.add(index['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }
}
