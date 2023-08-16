import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          // color: Colors.white,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Monthly Transactions'), // Add a title
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: const TextStyle(
                fontSize: 12,
              ), // Customize label style
            ),
            primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.currency(
                  locale: 'en_US',
                  symbol: 'KES'), // Format Y-axis labels as currency
              labelStyle: const TextStyle(
                fontSize: 12,
              ), // Customize label style
            ),
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
                color: Colors.blue,
              ),
              ColumnSeries<TransactionData, String>(
                dataSource: data,
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.month,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.lend,
                name: 'Lend',
                color: Colors.green,
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
            tooltipBehavior: TooltipBehavior(
                enable: true,
                header: '',
                format: 'point.y KES'), // Add tooltip behavior
            trackballBehavior: TrackballBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                lineType: TrackballLineType.vertical), // Add trackball behavior
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final transaction = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(transaction.month),
                      const SizedBox(width: 16.0),
                      Text('Borrowed: KES ${transaction.borrow}'),
                      const SizedBox(width: 16.0),
                      Text('Lent: KES ${transaction.lend}'),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            );
          },
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
