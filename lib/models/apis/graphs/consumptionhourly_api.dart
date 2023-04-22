import 'dart:convert';
import 'package:energyapp_v3/views/widgets/graphs/classes/consumption_hourly.dart';
import 'package:http/http.dart' as http;

class ConsumptionHourlyAPI{
  Future<List<ConsumptionHourly>> getConsumptionHourly() async {
    try {
      final response = await http.get(
          Uri.parse('http://10.0.2.2:8000/api/consumption/every_hour/day')
      ).timeout(Duration(seconds: 3000));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<ConsumptionHourly> consumptionHourlies = [];
        data.forEach((key, value) {
          consumptionHourlies.add(ConsumptionHourly(hour: int.parse(key), consumption: value));
        });
        return consumptionHourlies;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}