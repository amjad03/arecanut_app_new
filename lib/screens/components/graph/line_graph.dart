import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataPoint {
  final int x;
  final double y;

  DataPoint(this.x, this.y);
}

final List<DataPoint> data = [
  // DataPoint(0, 5.0),
  // DataPoint(1, 5.5),
  // DataPoint(2, 6.2),
  // DataPoint(3, 7.1),
  // DataPoint(4, 6.8),
  DataPoint(0, 2230),
  DataPoint(1, 2165),
  DataPoint(2, 2320),
  DataPoint(3, 908),
  DataPoint(4, 1543),
  DataPoint(5, 2450),
  DataPoint(6, 2345),
  DataPoint(7, 2205),
  DataPoint(8, 2380),
  DataPoint(9, 2485),
  DataPoint(10, 1090),
  DataPoint(11, 2125),
  DataPoint(12, 2060),
  DataPoint(13, 2405),
  DataPoint(14, 2520),
  DataPoint(15, 2305),
  DataPoint(16, 998),
  DataPoint(17, 2315),
  DataPoint(18, 2490),
  DataPoint(19, 2365)
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
