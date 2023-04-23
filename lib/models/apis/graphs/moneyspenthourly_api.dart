import 'dart:convert';
import 'package:energyapp_v3/views/widgets/graphs/classes/moneyspent_hourly.dart';
import 'package:http/http.dart' as http;

class MoneySpentHourlyAPI{
  Future<List<MoneySpentHourly>> getMoneySpentHourly() async {
    try {
      final response = await http.get(
          Uri.parse('http://10.0.2.2:8000/api/money_spent/every_hour/day')
      ).timeout(Duration(seconds: 3000));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<MoneySpentHourly> moneyspentHourlies = [];
        data.forEach((key, value) {
          moneyspentHourlies.add(MoneySpentHourly(hour: int.parse(key), moneyspent: value));
        });
        return moneyspentHourlies;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}