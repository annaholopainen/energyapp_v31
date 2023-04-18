import 'dart:convert';
import 'package:energyapp_v3/views/widgets/temperature.dart';
import 'package:http/http.dart' as http;

class TemperatureAPI{
  Future<Temperature> getTemperature() async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/advise_firewood_warming')
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final temperature = Temperature(value: data['temperature']);
      return temperature;
    } else {
      throw Exception('Failed to load data');
    }
  }}