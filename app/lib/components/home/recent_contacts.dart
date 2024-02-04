import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/static_data.dart';
import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class RecentContacts extends ConsumerWidget {
  const RecentContacts({
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
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      padding: EdgeInsets.only(
        left: width * 0.01,
        top: height * 0.01,
        bottom: height * 0.005,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: colorData.primaryColor(.08),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: width * 0.03,
                right: width * 0.04,
                top: height * 0.01,
                bottom: height * 0.005),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Send Money to',
                  size: sizeData.medium,
                  weight: FontWeight.w700,
                  color: colorData.fontColor(.8),
                ),
                CustomText(
                  text: "View All",
                  size: sizeData.small,
                  color: colorData.fontColor(.8),
                )
              ],
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.12,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: avatarColors.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: height * 0.008),
                          padding: EdgeInsets.all(aspectRatio * 18),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: avatarColors[index],
                          ),
                          child: Image.asset(
                            "assets/images/avatars/avatar${6 + index}.png",
                            width: aspectRatio * 62,
                            height: aspectRatio * 62,
                            fit: BoxFit.fill,
                          ),
                        ),
                        CustomText(
                          text: "Jessica",
                          size: sizeData.small,
                          weight: FontWeight.w800,
                          color: colorData.fontColor(.6),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
