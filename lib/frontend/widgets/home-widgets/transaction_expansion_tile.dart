import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TransactionChart extends StatelessWidget {
  final Map<String, double> dataMap = {
    "Total lend": 70000,
    "Collected": 75000,
    "Remaining": 25000,
  };

  TransactionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Chart'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 1000),
                chartLegendSpacing: 34,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                colorList: const [
                  Color.fromARGB(255, 133, 206, 135),
                  Color.fromARGB(255, 131, 192, 241),
                  Color.fromARGB(255, 240, 167, 162),
                ],
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 20,
                centerText: "Transaction Details",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
