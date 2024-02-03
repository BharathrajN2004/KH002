import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utilities/theme/color_data.dart';
import '../../Utilities/theme/size_data.dart';
import '../common/text.dart';

class ChartToggle extends ConsumerWidget {
  const ChartToggle({
    super.key,
    required this.header,
    required this.fixed,
  });

  final String header;
  final bool fixed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double width = sizeData.width;

    return Row(
      children: [
        Container(
          width: width * 0.06,
          height: 6,
          decoration: BoxDecoration(
            color:
                fixed ? colorData.primaryColor(1) : colorData.secondaryColor(1),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        SizedBox(
          width: width * 0.01,
        ),
        CustomText(
          text: header,
          color: colorData.fontColor(.8),
          weight: FontWeight.w800,
        ),
      ],
    );
  }
}
