import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getData() async {
  final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/spot_price')
  );

  if (response.statusCode == 200) {
    // Parse the JSON response
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}