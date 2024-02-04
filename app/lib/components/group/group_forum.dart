import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utilities/theme/color_data.dart';
import '../../Utilities/theme/size_data.dart';

class GroupForum extends ConsumerWidget {
  const GroupForum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorData.backgroundColor(1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.06,
            right: width * 0.06,
          ),
          decoration: BoxDecoration(
            color: colorData.backgroundColor(1),
          ),
        ),
      ),
    );
  }
}
