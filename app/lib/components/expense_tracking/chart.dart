import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utilities/theme/size_data.dart';
import 'chart_toggle.dart';
import 'column_chart.dart';
import 'pie_chart.dart';

class Chart extends ConsumerStatefulWidget {
  const Chart({
    super.key,
  });
  ConsumerState<Chart> createState() => _chartState();
}

class _chartState extends ConsumerState<Chart> {
  String chartToggle = "TRACKING";
  @override
  Widget build(BuildContext context) {
    CustomSizeData sizeData = CustomSizeData.from(context);

    double height = sizeData.height;
    return Column(
      children: [
        chartToggle == "TRACKING" ? ColumnChart() : PieChart(),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                chartToggle = "TRACKING";
              }),
              child: ChartToggle(
                fixed: chartToggle == "TRACKING",
                header: "TRACKING",
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                chartToggle = "ANALYSIS";
              }),
              child: ChartToggle(
                fixed: chartToggle == "ANALYSIS",
                header: "ANALYSIS",
              ),
            )
          ],
        ),
      ],
    );
  }
}
