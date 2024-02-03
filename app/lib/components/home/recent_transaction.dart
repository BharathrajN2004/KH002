import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/icon.dart';
import '../common/text.dart';

class RecentTransaction extends ConsumerWidget {
  RecentTransaction({super.key});
  List<Map<String, Object>> transactionData = [
    {
      "name": "Daya",
      "date": "11Sep2023",
      "iconData": Icons.add_rounded,
      "amount": "₹400",
    },
    {
      "name": "Netflix",
      "date": "14Sep2023",
      "iconData": Icons.remove_rounded,
      "amount": "₹649",
    },
    {
      "name": "Bharath N",
      "date": "6Sep2023",
      "iconData": Icons.add_rounded,
      "amount": "₹1000",
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
            text: 'Recent Transactions',
            size: sizeData.medium,
            color: colorData.fontColor(.6),
            weight: FontWeight.w800,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          ...transactionData
              .map(
                (e) => Container(
                  margin: EdgeInsets.only(bottom: height * 0.01),
                  padding: EdgeInsets.all(aspectRation * 22),
                  decoration: BoxDecoration(
                    color: colorData.secondaryColor(1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(aspectRation * 22),
                          decoration: BoxDecoration(
                            color: colorData.primaryColor(.05),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            size: aspectRation * 60,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: e["name"].toString(),
                              size: sizeData.regular,
                              weight: FontWeight.w800,
                            ),
                            CustomText(
                                text: e["date"].toString(),
                                color: colorData.fontColor(.6),
                                size: sizeData.small,
                                weight: FontWeight.w500),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          e["iconData"] as IconData?,
                          color: (e["iconData"] as IconData?) ==
                                  Icons.remove_rounded
                              ? Colors.red
                              : Colors.green,
                          size: aspectRation * 50,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        CustomText(
                          text: e["amount"].toString(),
                          color: colorData.fontColor(1),
                          size: sizeData.subHeader,
                          weight: FontWeight.w800,
                        )
                      ]),
                ),
              )
              .toList(),
          SizedBox(
            height: height * 0.005,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(aspectRation * 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorData.primaryColor(.05),
              ),
              child: Row(children: [
                Spacer(),
                CustomText(text: "See All Transactions"),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: aspectRation * 12,
                      horizontal: aspectRation * 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: colorData.secondaryColor(1),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: aspectRation * 40,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
