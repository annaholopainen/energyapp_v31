import 'dart:convert';
import 'package:energyapp_v3/views/widgets/graphs/consumptionhourly.dart';
import 'package:http/http.dart' as http;

class ConsumptionHourlyAPI{
  Future<List<ConsumptionHourly>> getConsumptionHourly() async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/consumption/every_hour/day')
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<ConsumptionHourly> consumptionHourlyList = [];
      data.forEach((key, value) {
        consumptionHourlyList.add(ConsumptionHourly.fromMap({
          'hour': int.parse(key),
          'consumption': value.toDouble(),
        }));
      });
      return consumptionHourlyList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}