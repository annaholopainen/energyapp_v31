
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color MediumBlue = Color(0xFF5AA8D2);
Color mediumBlueWithOpacity = Color(0xFF5AA8D2).withOpacity(0.6);

class FireplaceCard extends StatelessWidget {
  final String? fireplaceAdvice;
  final int? category;

  FireplaceCard({
    required this.fireplaceAdvice,
    required this.category,
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
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 40.0),
              child: Text(
                  "Fireplace Advice"
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$fireplaceAdvice',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                      children:const <TextSpan>[
                        TextSpan(text: ' kW', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset(
                    'assets/my_image.svg',
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Text(
                  'Category: $category'
              ),
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
