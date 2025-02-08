import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const ChartWidget({super.key, @required this.seriesList, this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
    );
  }
}
