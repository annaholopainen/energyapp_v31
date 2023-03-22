import 'package:energyapp_v3/views/widgets/spotprice_box.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/spotpriceapi.dart';
import 'package:energyapp_v3/views/loading_screen.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';

Color MyColor = Color(0xFFa3d0e8);

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                Container(
                  child: FutureBuilder<SpotPrice?>(
                    future: SpotPriceAPI().getSpotPrice(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingScreen();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return SpotPriceCard(
                          spotprice: snapshot.data?.value,
                          date: '22/03/2023',
                        );
                      }
                    },
                  ),
                ),
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
            unselectedItemColor: Colors.indigo,
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