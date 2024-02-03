import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';

import 'icon.dart';

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double aspectRatio = sizeData.aspectRatio;
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(aspectRatio * 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(aspectRatio * 14),
          color: colorData.primaryColor(1),
        ),
        child: CustomIcon(
          icon: Icons.menu_rounded,
          color: colorData.backgroundColor(.85),
          size: aspectRatio * 40,
        ),
      ),
    );
  }
}
