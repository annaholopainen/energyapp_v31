import 'package:energyapp_v3/views/graphs_screen.dart';
import 'package:energyapp_v3/views/home_screen.dart';
import 'package:energyapp_v3/views/profile_screen.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/fireplaceadvice.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';
import 'package:energyapp_v3/views/widgets/temperature.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  final SpotPrice? spotPrice;
  final ConsumptionToday? consumptionToday;
  final FireplaceAdvice? fireplaceAdvice;
  final Temperature? temperature;

  const NavigationPage({
    Key? key,
    required this.spotPrice,
    required this.consumptionToday,
    required this.fireplaceAdvice,
    required this.temperature,
  }) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(
      spotPrice: _spotPrice,
      consumptionToday: _consumptionToday,
      fireplaceAdvice: _fireplaceAdvice,
      temperature: _temperature,
    ),
    GraphsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[500],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_sharp),
            label: 'Graphs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}





