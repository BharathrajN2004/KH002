import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/static_data.dart';
import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class RecentSplit extends ConsumerWidget {
  const RecentSplit({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Recent Splits",
          size: sizeData.medium,
          color: colorData.fontColor(.6),
          weight: FontWeight.w800,
        ),
        SizedBox(
          height: height * 0.015,
        ),
        Container(
          margin: EdgeInsets.only(bottom: height * 0.015),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.025,
            vertical: height * 0.008,
          ),
          decoration: BoxDecoration(
              color: colorData.secondaryColor(1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Dominos Pizza Party",
                    weight: FontWeight.w800,
                    color: colorData.fontColor(.8),
                  ),
                  SizedBox(
                    height: height * 0.0075,
                  ),
                  CustomText(
                    text: "Total Payment INR 996.00",
                    size: sizeData.verySmall,
                    weight: FontWeight.w700,
                    color: colorData.fontColor(.4),
                  ),
                  SizedBox(
                    height: height * 0.0075,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.all(aspectRatio * 8),
                        decoration: BoxDecoration(
                          color: avatarColors[0],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/avatars/avatar10.png",
                          width: aspectRatio * 40,
                          height: aspectRatio * 40,
                        ),
                      ),
                      Positioned(
                        left: aspectRatio * 40,
                        child: Container(
                          padding: EdgeInsets.all(aspectRatio * 8),
                          decoration: BoxDecoration(
                            color: avatarColors[1],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/avatars/avatar8.png",
                            width: aspectRatio * 40,
                            height: aspectRatio * 40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: (aspectRatio * 40) * 2,
                        child: Container(
                          padding: EdgeInsets.all(aspectRatio * 8),
                          decoration: BoxDecoration(
                            color: avatarColors[3],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/avatars/avatar7.png",
                            width: aspectRatio * 40,
                            height: aspectRatio * 40,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: width * 0.03),
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: .33,
                      backgroundColor: colorData.primaryColor(.1),
                      color: colorData.primaryColor(1),
                      strokeCap: StrokeCap.round,
                      strokeWidth: aspectRatio * 9,
                      strokeAlign: aspectRatio * 5,
                    ),
                    Positioned(
                      top: aspectRatio * 8,
                      left: aspectRatio * 14,
                      child: CustomText(
                        text: "33%",
                        size: sizeData.small,
                        color: colorData.fontColor(.6),
                        weight: FontWeight.w800,
                      ),
                    ),
                    Positioned(
                      top: aspectRatio * 40,
                      left: aspectRatio * 14,
                      child: CustomText(
                        text: "Paid",
                        size: sizeData.tooSmall,
                        color: colorData.fontColor(.3),
                        weight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
