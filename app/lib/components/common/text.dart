import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utilities/theme/size_data.dart';
import '../../utilities/theme/color_data.dart';



class CustomText extends ConsumerWidget {
  final String text;
  final FontWeight weight;
  final double? size;
  final Color? color;
  final double height;
  final TextAlign align;
  final int maxLine;

  const CustomText({
    super.key,
    this.color,
    this.size,
    required this.text,
    this.height = 0,
    this.weight = FontWeight.w600,
    this.align = TextAlign.start,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomColorData colorData = CustomColorData.from(ref);
    CustomSizeData sizeData = CustomSizeData.from(context);

    return Text(
      text,
      textAlign: align,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size ?? sizeData.regular,
        fontWeight: weight,
        color: color ?? colorData.fontColor(.6),
        height: height,
      ),
    );
  }
}
