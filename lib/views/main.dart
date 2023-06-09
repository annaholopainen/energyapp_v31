import 'package:energyapp_v3/models/apis/consumptiontoday_api.dart';
import 'package:energyapp_v3/models/apis/fireplace_api.dart';
import 'package:energyapp_v3/models/apis/spotprice_api.dart';
import 'package:energyapp_v3/models/apis/temperature_api.dart';
import 'package:energyapp_v3/views/loading_screen.dart';
import 'package:energyapp_v3/views/navigation_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<List<dynamic>> apiData = Future.wait([
    SpotPriceAPI().getSpotPrice(), // my first API call
    ConsumptionTodayAPI().getConsumptionToday(),
    FireplaceAdviceAPI().getFireplaceAdvice(),
    TemperatureAPI().getTemperature(),
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: FutureBuilder(
        future: apiData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            // Once the data is loaded, show the screen that displays it.
            return MainPage(
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