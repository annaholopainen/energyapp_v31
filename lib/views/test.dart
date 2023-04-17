import 'package:energyapp_v3/views/widgets/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday_card.dart';
import 'package:energyapp_v3/views/widgets/spotprice_box.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';
import 'package:intl/intl.dart';



Color MyColor = Color(0xFFa3d0e8);
Color MediumBlue = Color(0xFF5AA8D2);
Color DarkBlue = Color(0xFF04669B);

class HomePage extends StatelessWidget {
  final SpotPrice? spotPrice;
  final ConsumptionToday? consumptionToday;

  const HomePage({
    Key? key,
    required this.spotPrice,
    required this.consumptionToday,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(today);
    return Scaffold(
    body: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: MyColor,
              image: DecorationImage(
                image: AssetImage('assets/BGShapes.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox()),
                  SizedBox(
                    height:150,
                    child:Container(
                        child:
                        SpotPriceCard(
                          spotprice: spotPrice?.value,
                          date: formattedDate,
                        ),
                    ), ),
                  SizedBox(
                    height:130,
                    child:                Container(
                      child: ConsumptionTodayCard(
                        consumptiontoday: consumptionToday?.value,
                      ),
                    ), ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            backgroundColor: MyColor,
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
          ),
        ),
      ],
    ),
    );
  }
}