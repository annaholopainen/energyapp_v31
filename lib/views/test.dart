import 'package:energyapp_v3/models/consumptiontoday_api.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday_card.dart';
import 'package:energyapp_v3/views/widgets/spotprice_box.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/spotpriceapi.dart';
import 'package:energyapp_v3/views/loading_screen.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


Color MyColor = Color(0xFFa3d0e8);
Color MediumBlue = Color(0xFF5AA8D2);
Color DarkBlue = Color(0xFF04669B);

class HomePage extends StatelessWidget {
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
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Welcome user',
                      style: TextStyle(
                        fontFamily: 'Didact Gothic',
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:150,
                  child:                Container(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: FutureBuilder<SpotPrice?>(
                    future: SpotPriceAPI().getSpotPrice(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: LoadingAnimationWidget.inkDrop(
                              color: Color(0xFF04669b),
                              size: 70),);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return SpotPriceCard(
                          spotprice: snapshot.data?.value,
                          date: formattedDate,
                        );
                      }
                    },
                  ),
                ), ),
                SizedBox(
                  height:130,
                  child:                Container(
                    child: FutureBuilder<ConsumptionToday?>(
                      future: ConsumptionTodayAPI().getConsumptionToday(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                              child: LoadingAnimationWidget.inkDrop(
                              color: Color(0xFF04669b),
                              size: 70),);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return ConsumptionTodayCard(
                            consumptiontoday: snapshot.data?.value,
                          );
                        }
                      },
                    ),
                  ), ),
                Expanded(child: SizedBox()),
              ],
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