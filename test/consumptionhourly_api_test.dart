import 'package:energyapp_v3/models/apis/graphs/consumptionhourly_api.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test('Test API call', () async {
    final api = ConsumptionHourlyAPI();
    final result = await api.getConsumptionHourly();
    expect(result.length, 24, reason: 'The returned list should have length 24');
    expect(result.first.hour, 0, reason: 'The first item in the list should have hour 0');
    expect(result.first.consumption, 0.9, reason: 'The first item in the list should have consumption 0.9');
    expect(result.last.hour, 23, reason: 'The last item in the list should have hour 23');
    expect(result.last.consumption, 0.8, reason: 'The last item in the list should have consumption 0.8');
  });
}