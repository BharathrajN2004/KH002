
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class Header extends ConsumerWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              CustomText(
                text: "Hey ",
                size: sizeData.subHeader,
                color: colorData.fontColor(.5),
              ),
              Expanded(
                child: CustomText(
                  text: "Sharjun A!",
                  size: sizeData.header,
                  color: colorData.fontColor(.8),
                ),
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: aspectRatio * 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.solidBell,
                  size: aspectRatio * 50,
                ),
              ),
            ),
            Positioned(
              top: -7,
              right: 4,
              child: Container(
                width: aspectRatio * 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade100,
                ),
                child: Center(
                  child: CustomText(
                    text: "2",
                    size: sizeData.tooSmall,
                    weight: FontWeight.w800,
                    color: colorData.fontColor(1),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Container(
          padding: EdgeInsets.all(
            aspectRatio * 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorData.primaryColor(1),
          ),
          child: Image.asset(
            "assets/images/avatars/avatar1.png",
            width: aspectRatio * 80,
            height: aspectRatio * 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
