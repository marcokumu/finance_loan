import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatelessWidget {
  final List<TransactionData> data;

  const BarGraph({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 300,
          padding: const EdgeInsets.all(16.0),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(
              isVisible: true,
              orientation: LegendItemOrientation.horizontal,
              position: LegendPosition.bottom,
              toggleSeriesVisibility: true,
            ),
            series: <ChartSeries>[
              ColumnSeries<TransactionData, String>(
                dataSource: data,
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.month,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.borrow,
                name: 'Borrow',
              ),
              ColumnSeries<TransactionData, String>(
                dataSource: data,
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.month,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.lend,
                name: 'Lend',
                trendlines: <Trendline>[
                  Trendline(
                    type: TrendlineType.linear,
                    width: 3,
                    dashArray: <double>[3, 3, 3, 3],
                  )
                ],
                initialSelectedDataIndexes: <int>[0, 1, 2, 3, 4, 5, 6],
              ),
            ],
            enableMultiSelection: true,
            selectionType: SelectionType.point,
            selectionGesture: ActivationMode.singleTap,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final transaction = data[index];
              return Flexible(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // First column: Month
                          Text(transaction.month),
                          // Second column: Borrowed and Lent
                          Padding(
                            padding: const EdgeInsets.only(left: 166.0),
                            child: Text(
                              'Borrowed: KES ${transaction.borrow}\nLent: KES ${transaction.lend}',
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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
