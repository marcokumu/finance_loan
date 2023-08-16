import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChart extends StatelessWidget {
  final double totalBorrow;
  final double totalLend;

  const RadialBarChart(
      {Key? key, required this.totalBorrow, required this.totalLend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
        ),
        series: <RadialBarSeries<Data, String>>[
          RadialBarSeries<Data, String>(
            dataSource: [
              Data('Borrow', totalBorrow),
              Data('Lend', totalLend),
            ],
            xValueMapper: (Data data, _) => data.category,
            yValueMapper: (Data data, _) => data.value,
            dataLabelMapper: (Data data, _) => '${data.value}',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 14, color: Colors.black),
            ),
            cornerStyle: CornerStyle.bothCurve,
            enableTooltip: true,
          ),
        ],
        enableMultiSelection: true,
        selectionGesture: ActivationMode.singleTap,
        onDataLabelTapped: (DataLabelTapDetails args) {
          // Handle data label tap if needed
        },
      ),
    );
  }
}

class Data {
  final String category;
  final double value;

  Data(this.category, this.value);
}
