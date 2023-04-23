
import 'package:flutter/material.dart';

Color MediumBlue = Color(0xFF5AA8D2);
Color mediumBlueWithOpacity = Color(0xFF5AA8D2).withOpacity(0.6);

class ConsumptionTodayCard extends StatelessWidget {
  final double? consumptiontoday;

  ConsumptionTodayCard({
    required this.consumptiontoday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: MediumBlue,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: mediumBlueWithOpacity,
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding:  EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 40.0),
                child: Text(
                    "Today's Electricity Consumption"
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left:5, top:5),
                child: RichText(
                  text: TextSpan(
                    text: '$consumptiontoday',
                    style: TextStyle(
                        fontFamily: 'Didact Gothic',
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    children:const <TextSpan>[
                      TextSpan(
                          text: ' kWh',
                          style: TextStyle(
                              fontFamily: 'Didact Gothic',
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          )
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
