import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getTodaysConsumption() async {
  final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/total_consumption/day')
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}