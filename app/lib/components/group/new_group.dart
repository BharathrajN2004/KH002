import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';
import 'create_group.dart';

class NewGroup extends ConsumerWidget {
  const NewGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorData.secondaryColor(1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.045,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(aspectRatio * 14),
              color: colorData.backgroundColor(1),
            ),
            child: TextField(
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: sizeData.regular,
                  height: 1),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: height * 0.008),
                hintText: "Search for friends",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: sizeData.regular,
                  color: colorData.fontColor(.6),
                  height: 1,
                ),
                border: InputBorder.none,
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: width * 0.01),
                  padding: EdgeInsets.all(aspectRatio * 20),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: aspectRatio * 40,
                  ),
                ),
              ),
              scrollPadding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            height: height * 0.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.01),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: width * 0.05, bottom: height * 0.015),
                        padding: EdgeInsets.all(
                          aspectRatio * 3,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorData.secondaryColor(1),
                        ),
                        child: Image.asset(
                          "assets/images/avatars/avatar2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: -4,
                        left: -3,
                        child: SizedBox(
                          width: width * .16,
                          child: CustomText(
                            text: "namesdf",
                            weight: FontWeight.w800,
                            size: sizeData.tooSmall,
                            color: colorData.fontColor(.5),
                            align: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          CreateGroup(),
        ],
      ),
    );
  }
}
