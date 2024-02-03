import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';

class ColumnChart extends ConsumerWidget {
  ColumnChart({super.key});
  final List<ChartData> chartData = [
    ChartData('Sun', 12, 10),
    ChartData('Mon', 12, 10),
    ChartData('Tue', 14, 11),
    ChartData('Wed', 16, 10),
    ChartData('Thu', 18, 16),
    ChartData('Fri', 16, 10),
    ChartData('Sat', 18, 16),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(color: Colors.transparent),
        ),
        primaryYAxis: CategoryAxis(
          isVisible: false,
        ),
        borderColor: Colors.transparent,
        series: <CartesianSeries>[
          StackedColumnSeries<ChartData, String>(
            borderRadius: BorderRadius.circular(20),
            width: .25,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1,
          ),
          StackedColumnSeries<ChartData, String>(
            borderRadius: BorderRadius.circular(20),
            width: .25,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y2,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}
