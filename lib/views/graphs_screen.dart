import 'package:energyapp_v3/views/widgets/graphs/cards/consumptionhourly_card.dart';
import 'package:energyapp_v3/views/widgets/graphs/cards/moneyspenthourly_card.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';

class GraphsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightBlue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/BGShapes.png",
            fit: BoxFit.cover,
          ),
          Container(
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   SizedBox(
                     height: 240,
                          child: ConsumptionHourlyChart().build(context),
                   ),
                    SizedBox(
                      height: 240,
                      child: MoneySpentHourlyChart().build(context),
                    ),
                  ],
                )
              ),

          )
        ],
      ),
    );
  }
}