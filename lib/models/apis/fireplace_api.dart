import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:energyapp_v3/views/widgets/classes/fireplaceadvice.dart';

class FireplaceAdviceAPI{
  Future<FireplaceAdvice> getFireplaceAdvice() async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/advise_firewood_warming')
    );
    if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final fireplaceAdvice = FireplaceAdvice(
            value: data["Advise"].toString().substring(0, data["Advise"].toString().lastIndexOf(' ')),
            category: data["Category"]
        );
        return fireplaceAdvice;
      } else {
        throw Exception('Failed to load data');
    }
  }}