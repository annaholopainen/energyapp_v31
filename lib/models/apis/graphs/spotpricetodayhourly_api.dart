import 'dart:convert';
import 'package:energyapp_v3/views/widgets/graphs/classes/spotpricetoday_hourly.dart';
import 'package:http/http.dart' as http;

class SpotPriceTodayHourlyAPI{
  Future<List<SpotPriceTodayHourly>> getSpotPriceTodayHourly() async {
    try {
      final response = await http.get(
          Uri.parse('http://10.0.2.2:8000//api/spot_price/day')
      ).timeout(Duration(seconds: 3000));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<SpotPriceTodayHourly> spotpricetodayHourlies = [];
        data.forEach((key, value) {
          spotpricetodayHourlies.add(SpotPriceTodayHourly(hour: int.parse(key), spotprice: value));
        });
        return spotpricetodayHourlies;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}