import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/group/existing_groups.dart';
import '../components/group/new_group.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../components/common/text.dart';

class Group extends ConsumerWidget {
  Group({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: "Groups",
          weight: FontWeight.w600,
          color: colorData.fontColor(.8),
          size: sizeData.header,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        NewGroup(),
        SizedBox(
          height: height * 0.025,
        ),
        ExistingGroups(),
      ],
    );
  }
}
