import 'package:energyapp_v3/views/graphs_screen.dart';
import 'package:energyapp_v3/views/home_page.dart';
import 'package:energyapp_v3/views/profile_screen.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/fireplaceadvice.dart';
import 'package:energyapp_v3/views/widgets/temperature.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';
import 'package:energyapp_v3/models/colors/DarkBlue.dart';

Color MediumBlue = Color(0xFF5AA8D2);

class MainPage extends StatefulWidget {
  final SpotPrice? spotPrice;
  final ConsumptionToday? consumptionToday;
  final FireplaceAdvice? fireplaceAdvice;
  final Temperature? temperature;

  const MainPage({
    Key? key,
    required this.spotPrice,
    required this.consumptionToday,
    required this.fireplaceAdvice,
    required this.temperature,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();

}
  class _MainPageState extends State<MainPage> {
    int _selectedIndex = 0;
    late List<Widget>  _widgetOptions;
    @override
    void initState() {
      super.initState();
      _widgetOptions = [
        HomePage(
            spotPrice: widget.spotPrice,
            consumptionToday: widget.consumptionToday,
            fireplaceAdvice: widget.fireplaceAdvice,
            temperature: widget.temperature
        ),
        GraphsPage(),
        ProfilePage(),
      ];
    }
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      }); }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: LightBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: DarkBlue,
        type: BottomNavigationBarType.fixed,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}