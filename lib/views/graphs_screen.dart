import 'package:energyapp_v3/views/widgets/graphs/cards/consumptionhourly_card.dart';
import 'package:energyapp_v3/views/widgets/graphs/cards/moneyspenthourly_card.dart';
import 'package:energyapp_v3/views/widgets/graphs/cards/spotpricetodayhourly_card.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';
import 'package:intl/intl.dart';

class GraphsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(today);
    return Scaffold(
      backgroundColor: LightBlue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/BGShapes.png",
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child:Container(
              alignment: Alignment.center,
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom:20, top: 60, left: 10, right:10),
                        child:RichText(
                          text: TextSpan(
                            text: 'Spot Price for today',
                            style: TextStyle(
                              fontFamily: 'Didact Gothic',
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                            children:[
                              TextSpan(
                                  text: '  $formattedDate',
                                  style: TextStyle(
                                    fontFamily: 'Didact Gothic',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 240,
                        child: SpotPriceTodayHourlyChart().build(context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:20, horizontal: 10),
                        child:                    Text(
                          'Statistics for the last 24hrs',
                          style: TextStyle(
                            fontFamily: 'Didact Gothic',
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
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
          )

        ],
      ),
    );
  }
}