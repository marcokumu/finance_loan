import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatelessWidget {
  final List<TransactionData> data;

  const BarGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          ColumnSeries<TransactionData, String>(
            dataSource: data,
            xValueMapper: (TransactionData transaction, _) => transaction.month,
            yValueMapper: (TransactionData transaction, _) =>
                transaction.borrow,
            name: 'Borrow',
            // color: Colors.blue,
          ),
          ColumnSeries<TransactionData, String>(
            dataSource: data,
            xValueMapper: (TransactionData transaction, _) => transaction.month,
            yValueMapper: (TransactionData transaction, _) => transaction.lend,
            name: 'Lend',
            // color: Colors.green,
          ),
        ],
        enableMultiSelection: true,
        selectionGesture: ActivationMode.singleTap,
      ),
    );
  }

  
}

class TransactionData {
  final String month;
  final double borrow;
  final double lend;

  TransactionData({
    required this.month,
    required this.borrow,
    required this.lend,
  });
}
