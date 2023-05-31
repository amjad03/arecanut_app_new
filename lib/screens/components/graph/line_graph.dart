import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class DataPoint {
  final int x;
  final double y;

  DataPoint(this.x, this.y);
}

final List<DataPoint> data = [
  DataPoint(0, 5.0),
  DataPoint(1, 5.5),
  DataPoint(2, 6.2),
  DataPoint(3, 7.1),
  DataPoint(4, 6.8),
  // Add more data points as needed
];

class LineGraph extends StatelessWidget {
  // final List<DataPoint> data;
  //
  // LineGraph(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataPoint, int>> series = [
      charts.Series<DataPoint, int>(
        id: 'graph',
        data: data,
        domainFn: (DataPoint point, _) => point.x,
        measureFn: (DataPoint point, _) => point.y,
      ),
    ];

    return charts.LineChart(
      series,
      animate: true,
    );
  }
}
