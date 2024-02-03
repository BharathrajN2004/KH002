import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class PaymentOption extends ConsumerWidget {
  final String text;
  final IconData icon;
  final Function todo;
  const PaymentOption({
    super.key,
    required this.text,
    required this.icon,
    required this.todo,
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
        Container(
          padding: EdgeInsets.all(aspectRatio * 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFF3EFFB),
          ),
          child: Icon(
            Icons.qr_code_scanner,
            color: colorData.fontColor(.6),
            size: aspectRatio * 45,
          ),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        CustomText(
          text: "QR Scan",
          color: colorData.fontColor(.5),
          size: sizeData.tooSmall,
          weight: FontWeight.w600,
        ),
      ],
    );
  }
}
