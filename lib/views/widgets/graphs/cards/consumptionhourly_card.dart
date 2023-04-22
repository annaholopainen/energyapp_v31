import 'package:energyapp_v3/models/colors/LightBlue.dart';
import 'package:energyapp_v3/views/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../models/apis/graphs/consumptionhourly_api.dart';
import '../classes/consumption_hourly.dart';

class ConsumptionHourlyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<ConsumptionHourly>>(
          future: ConsumptionHourlyAPI().getConsumptionHourly(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ConsumptionHourly> consumptionHourlies = snapshot.data!;
              final List<BarChartGroupData> barChartData = consumptionHourlies.map((hourly) => BarChartGroupData(
                x: hourly.hour,
                barRods: [
                  BarChartRodData(
                      toY: hourly.consumption.toDouble(),
                      color: LightBlue,
                  ),
                ],
              )).toList();
              return Container(
                  height: 220,
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
                  child:Stack(
                    children:[
                      Align(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                          child: Text(
                              'kWh consumption per hour'

                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                       Align(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: SizedBox(
                            height: 175,
                            child:Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 15),
                              child: BarChart(
                                BarChartData(
                                  gridData: FlGridData(
                                    show: true,
                                    horizontalInterval: 0.1, // Show lines for every 0.1
                                    getDrawingHorizontalLine: (value) => FlLine(
                                      color: Colors.grey,
                                      strokeWidth: 1,
                                    ),
                                    drawVerticalLine: true,
                                    getDrawingVerticalLine: (value) => FlLine(
                                      color: Colors.grey,
                                      strokeWidth: 1,
                                    ),
                                  ),
                                  barGroups: barChartData,
                                  titlesData: FlTitlesData(
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: bottomTitles,
                                      ),
                                    ),
                                  ),
                                  minY: 0, // Set the minimum y-value to 0
                                  maxY: consumptionHourlies.map((hourly) => hourly.consumption).reduce((max, value) => max > value ? max : value) + 0.1, // Add 10 units of padding to the max y-value
                                ),
                              ),
                            ),
                          ),

                        ),
                        alignment: Alignment.bottomCenter,
                        ),
                    ],
                  )
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return LoadingScreen();
          },
        ),
    );
  }
}

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = ["0","","", "3", "","", "6", "","", "9", "","", "12", "","", "15", "","", "18","","",  "21",];

  if (value < 0 || value >= titles.length) {
    return Container();
  }
  final Widget text = Text(
    titles[value.toInt()],
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}