import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class SavedCards extends ConsumerWidget {
  SavedCards({super.key});
  List cards = [
    {
      "image": "assets/images/payment_options/Cards/Axis.png",
      "name": "Flipkart Axis Bank Credit Card",
      "type": "Mastercard",
    },
    {
      "image": "assets/images/payment_options/Cards/sbi.png",
      "name": "SBI Simply Save Credit Card",
      "type": "Visa",
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double aspectRation = sizeData.aspectRatio;
    double height = sizeData.height;
    double width = sizeData.width;

    return Container(
      margin: EdgeInsets.only(top: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            text: 'SAVED CARDS',
            size: sizeData.medium,
            color: colorData.fontColor(.6),
            weight: FontWeight.w800,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: height * 0.1,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width * .6,
                        margin: EdgeInsets.only(
                            bottom: height * 0.01, right: width * 0.04),
                        padding: EdgeInsets.all(aspectRation * 12),
                        decoration: BoxDecoration(
                          color: colorData.secondaryColor(1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width * .18,
                                height: height,
                                padding: EdgeInsets.all(aspectRation * 8),
                                decoration: BoxDecoration(
                                  color: colorData.primaryColor(.05),
                                  borderRadius: BorderRadius.circular(8),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Image.asset(
                                  cards[index]["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height * 0.002,
                                    ),
                                    CustomText(
                                      text: cards[index]["name"],
                                      size: sizeData.regular,
                                      weight: FontWeight.w700,
                                      color: colorData.fontColor(.8),
                                      maxLine: 2,
                                    ),
                                    SizedBox(
                                      height: height * 0.006,
                                    ),
                                    CustomText(
                                      text: cards[index]["type"],
                                      size: sizeData.verySmall,
                                      weight: FontWeight.w600,
                                      color: colorData.fontColor(.6),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorData.secondaryColor(1),
                ),
                padding: EdgeInsets.all(aspectRation * 20),
                child: Icon(
                  Icons.add_rounded,
                  size: aspectRation * 60,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
