import 'package:energyapp_v3/views/widgets/classes/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/cards/consumptiontoday_card.dart';
import 'package:energyapp_v3/views/widgets/classes/fireplaceadvice.dart';
import 'package:energyapp_v3/views/widgets/cards/fireplace_card.dart';
import 'package:energyapp_v3/views/widgets/cards/spotprice_card.dart';
import 'package:energyapp_v3/views/widgets/classes/temperature.dart';
import 'package:energyapp_v3/views/widgets/cards/temperature_card.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/widgets/classes/spotprice.dart';
import 'package:intl/intl.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';

Color MediumBlue = Color(0xFF5AA8D2);

class HomePage extends StatelessWidget {
  final SpotPrice? spotPrice;
  final ConsumptionToday? consumptionToday;
  final FireplaceAdvice? fireplaceAdvice;
  final Temperature? temperature;

  const HomePage({
    Key? key,
    required this.spotPrice,
    required this.consumptionToday,
    required this.fireplaceAdvice,
    required this.temperature,
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
                color: LightBlue,
                image: DecorationImage(
                  image: AssetImage('assets/BGShapes.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Align(
                      child:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:Text(
                          'Nice to see you, John',
                          style: TextStyle(
                            fontFamily: 'Didact Gothic',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 130,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0), // set the desired padding value
                          child: Container(
                            child: TemperatureCard(
                              temperature: temperature?.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:150,
                      child: Container(
                        child:
                        SpotPriceCard(
                          spotprice: spotPrice?.value,
                          date: formattedDate,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:130,
                      child: Container(
                        child: FireplaceCard(
                          category: fireplaceAdvice?.category,
                          fireplaceAdvice: fireplaceAdvice?.value,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:130,
                      child: Container(
                        child: ConsumptionTodayCard(
                          consumptiontoday: consumptionToday?.value,
                        ),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}