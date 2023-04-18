import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:energyapp_v3/views/widgets/classes/spotprice.dart';

class SpotPriceAPI{
  Future<SpotPrice> getSpotPrice() async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/spot_price')
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final spotprice = SpotPrice(value: data['spot_price']);
    return spotprice;
  } else {
    throw Exception('Failed to load data');
  }
}}
