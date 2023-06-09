import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:energyapp_v3/views/widgets/classes/consumptiontoday.dart';

class ConsumptionTodayAPI{
  Future<ConsumptionToday> getConsumptionToday() async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/total_consumption/day')
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String consumptionString = data["consumption in the 24 hours"].replaceAll(" kWh", "");
      double consumptionDouble = double.parse(consumptionString);
      final consumptiontoday = ConsumptionToday(value: consumptionDouble);
      return consumptiontoday;
    } else {
      throw Exception('Failed to load data');
    }
  }}
