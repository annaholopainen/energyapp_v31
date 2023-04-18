import 'package:energyapp_v3/models/consumptiontoday_api.dart';
import 'package:energyapp_v3/models/fireplace_api.dart';
import 'package:energyapp_v3/models/spotprice_api.dart';
import 'package:energyapp_v3/models/temperature_api.dart';
import 'package:energyapp_v3/views/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/navigation_screen.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/fireplaceadvice.dart';
import 'package:energyapp_v3/views/widgets/temperature.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpotPrice? _spotPrice;
  ConsumptionToday? _consumptionToday;
  FireplaceAdvice? _fireplaceAdvice;
  Temperature? _temperature;

  @override
  void initState() {
    super.initState();
    apiData;
  }

  final Future<List<dynamic>> apiData = Future.wait([
  SpotPriceAPI().getSpotPrice(), // my first API call
  ConsumptionTodayAPI().getConsumptionToday(),
  FireplaceAdviceAPI().getFireplaceAdvice(),
  TemperatureAPI().getTemperature(),
  ]);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Energy App',
  home: FutureBuilder(
  future: apiData,
  builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return LoadingScreen();
  } else {
  // Once the data is loaded, show the screen that displays it.
  return NavigationPage(
  spotPrice: snapshot.data![0], // data from first API call
  consumptionToday: snapshot.data![1], // data from second API call
  fireplaceAdvice: snapshot.data![2],
  temperature: snapshot.data![3],
  );
  }
  },
  ),
  );
  }
  }

