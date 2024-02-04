import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class Upis extends ConsumerWidget {
  Upis({super.key});

  List upis = [
    {"name": "9523648970@okaxis"},
    {"name": "9523648970@kotak"}
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double aspectRatio = sizeData.aspectRatio;
    double height = sizeData.height;
    double width = sizeData.width;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'UPI IDs',
                  size: sizeData.medium,
                  color: colorData.fontColor(.6),
                  weight: FontWeight.w800,
                ),
                Icon(
                  Icons.add_rounded,
                  size: aspectRatio * 55,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: upis.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: width * .6,
                    margin: EdgeInsets.only(
                        bottom: height * 0.01, right: width * 0.04),
                    padding: EdgeInsets.all(aspectRatio * 12),
                    // decoration: BoxDecoration(
                    //   color: colorData.secondaryColor(1),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: width * 0.01),
                        width: aspectRatio * 16,
                        height: aspectRatio * 16,
                        decoration: BoxDecoration(
                          color: colorData.primaryColor(1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomText(
                        text: upis[index]["name"],
                        size: sizeData.medium,
                        weight: FontWeight.w700,
                        color: colorData.fontColor(.8),
                        maxLine: 2,
                      ),
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
