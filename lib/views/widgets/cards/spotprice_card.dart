import 'package:flutter/material.dart';

class SpotPriceCard extends StatelessWidget {
  final double? spotprice;
  final String date;

  SpotPriceCard({
    required this.spotprice,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.6),
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
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Text(
                    'Spot price right now',
                  style: TextStyle(
                  fontFamily: 'Didact Gothic',
                ),
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: RichText(
                  text: TextSpan(
                    text:'$spotprice',
                    style: TextStyle(
                        fontFamily: 'Didact Gothic',
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: ' snt/kWh', style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Text(
                    date,
                  style: TextStyle(
                    fontFamily: 'Didact Gothic',
                  ),
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      );
  }
}
