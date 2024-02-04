import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Utilities/theme/color_data.dart';
import '../../Utilities/theme/size_data.dart';
import 'icon.dart';

class CustomBackButton extends ConsumerWidget {
  final Function? method;
  const CustomBackButton({super.key, this.method});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double aspectRatio = sizeData.aspectRatio;

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        method != null ? method!(ref) : null;
      },
      child: CustomIcon(
        icon: FontAwesomeIcons.arrowLeft,
        color: colorData.fontColor(.8),
        size: aspectRatio * 60,
      ),
    );
  }
}
