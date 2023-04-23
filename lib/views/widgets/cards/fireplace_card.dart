
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
        color: Colors.white,
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
                  "Fireplace Advice",
                 style: TextStyle(
                   fontFamily: 'Didact Gothic',
                 ),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(left:15, right: 15),
              child: SvgPicture.asset(
                'assets/fireplace.svg',
                height: 35,
                width: 35,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: RichText(
                text: TextSpan(
                  text: '$fireplaceAdvice',
                  style: TextStyle(
                      fontFamily: 'Didact Gothic',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
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
