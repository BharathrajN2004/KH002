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
    return GestureDetector(
      onTap: todo(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.025),
            padding: EdgeInsets.all(aspectRatio * 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFF3EFFB),
            ),
            child: Icon(
              icon,
              color: colorData.fontColor(.6),
              size: aspectRatio * 45,
            ),
          ),
          Positioned(
            bottom: 0,
            left: -width*0.04,
            child: SizedBox(
              width: width*0.2,
              child: CustomText(
                text: text,
                color: colorData.fontColor(.5),
                size: sizeData.tooSmall,
                weight: FontWeight.w600,
                align: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
