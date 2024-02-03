import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('USA', 10, '70%'),
      ChartData('China', 11, '60%'),
      ChartData('Russia', 9, '52%'),
      ChartData('Germany', 10, '40%')
    ];
    return Container(
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Radius for each segment from data source
              pointRadiusMapper: (ChartData data, _) => data.size)
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size);
  final String x;
  final double y;
  final String size;
}
