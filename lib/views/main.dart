import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/spotpriceapi.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';

import 'loading_screen.dart';

Color MyColor = Color(0xFFa3d0e8);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  SpotPrice? spotPrice;

  @override
  void initState() {
    super.initState();
    _fetchSpotPrice();
  }

  Future<void> _fetchSpotPrice() async {
    setState(() {
      isLoading = true;
    });

    final api = SpotPriceAPI();
    spotPrice = await api.getSpotPrice();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/BGShapes.png",
            fit: BoxFit.cover,
          ),
          Center(
            child: isLoading
                ? LoadingScreen()
                : Text('spot price is: ${spotPrice?.value}'),
          ),
        ]

      )

    );
  }
}