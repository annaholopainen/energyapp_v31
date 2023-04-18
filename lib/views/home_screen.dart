import 'package:energyapp_v3/views/widgets/consumptiontoday.dart';
import 'package:energyapp_v3/views/widgets/consumptiontoday_card.dart';
import 'package:energyapp_v3/views/widgets/fireplaceadvice.dart';
import 'package:energyapp_v3/views/widgets/fireplace_card.dart';
import 'package:energyapp_v3/views/widgets/spotprice_card.dart';
import 'package:energyapp_v3/views/widgets/temperature.dart';
import 'package:energyapp_v3/views/widgets/temperature_card.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/widgets/spotprice.dart';
import 'package:intl/intl.dart';
import 'package:energyapp_v3/models/MyColor.dart';


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
                    Spacer(),
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
