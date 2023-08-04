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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Adjust alignment
                      children: [
                        // First column: Month
                        Text(
                          transaction.month,
                          style:
                              const TextStyle(fontSize: 12), // Adjust font size
                        ),
                        // Second column: Borrowed and Lent
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Borrowed:',
                                  style: TextStyle(
                                      fontSize: 12), // Adjust font size
                                ),
                                Text(
                                  'Lent:',
                                  style: TextStyle(
                                      fontSize: 12), // Adjust font size
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'KES ${transaction.borrow}',
                                style: const TextStyle(
                                    fontSize: 12), // Adjust font size
                              ),
                              Text(
                                'KES ${transaction.lend}',
                                style: const TextStyle(
                                    fontSize: 12), // Adjust font size
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
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
