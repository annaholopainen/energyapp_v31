import 'package:energyapp_v3/home_screen.dart';
import 'package:energyapp_v3/models/spotpriceapi.dart';
import 'package:energyapp_v3/views/loading_screen.dart';
import 'package:energyapp_v3/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/test.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'My App',
    home: HomePage(),
    );
  }
}

