import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utilities/theme/color_data.dart';
import '../../Utilities/theme/size_data.dart';
// import '../../pages/add_staff.dart';
// import '../../pages/details/staff_detail.dart';
// import '../../pages/show_all/staffs.dart';
import '../common/icon.dart';
import '../common/text.dart';

class GroupList extends ConsumerWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double width = sizeData.width;
    double height = sizeData.height;
    double aspectRatio = sizeData.aspectRatio;

    return Column(
      children: [
        // Header Text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "Staffs",
              size: sizeData.subHeader,
              color: colorData.fontColor(.8),
              weight: FontWeight.w600,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "All",
                    size: sizeData.medium,
                    color: colorData.fontColor(.8),
                  ),
                  CustomIcon(
                    size: sizeData.subHeader,
                    icon: Icons.arrow_forward_ios_rounded,
                    color: colorData.fontColor(.8),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.0125,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(6),
                margin:
                    EdgeInsets.only(right: width * 0.02, left: width * 0.01),
                decoration: BoxDecoration(
                  color: colorData.backgroundColor(1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomIcon(
                  size: aspectRatio * 60,
                  icon: Icons.add_rounded,
                  color: colorData.fontColor(.7),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: height * 0.075,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: width * 0.145,
                        margin: EdgeInsets.only(
                          right: width * 0.04,
                        ),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: colorData.secondaryColor(1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "https://raw.githubusercontent.com/fluttercommunity/community/resources/banner.png",
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context,
                                Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Shimmer.fromColors(
                                  baseColor: colorData.backgroundColor(.1),
                                  highlightColor:
                                      colorData.secondaryColor(.1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorData.secondaryColor(.5),
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
