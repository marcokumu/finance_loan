import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChart extends StatelessWidget {
  final double totalBorrow;
  final double totalLend;

  const RadialBarChart(
      {super.key, required this.totalBorrow, required this.totalLend});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          // overflowMode: LegendItemOverflowMode.wrap,
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
            dataLabelMapper: (Data data, _) =>
                data.category, // Use category as data label text
            dataLabelSettings: const DataLabelSettings(
              isVisible: false,
              textStyle: TextStyle(
                fontSize: 16,
              ),
            ),
            cornerStyle: CornerStyle.bothCurve,
          ),
        ],
        enableMultiSelection: true, // Enable selection
        selectionGesture: ActivationMode.singleTap, // Set the selection gesture
        
      ),
    );
  }
}

class Data {
  final String category;
  final double value;

  Data(this.category, this.value);
}
