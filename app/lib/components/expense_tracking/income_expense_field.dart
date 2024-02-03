import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utilities/theme/color_data.dart';
import '../../Utilities/theme/size_data.dart';
import '../common/text.dart';

class IncomeExpenseField extends ConsumerWidget {
  final String header;
  final double value;
  const IncomeExpenseField({
    required this.header,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Column(
      children: [
        CustomText(
          text: header,
          weight: FontWeight.w600,
          color: colorData.fontColor(.5),
          size: sizeData.small,
        ),
        SizedBox(
          height: height * 0.006,
        ),
        CustomText(
          text: "₹$value",
          weight: FontWeight.w800,
          color: colorData.fontColor(.8),
          size: sizeData.header,
        ),
      ],
    );
  }
}
