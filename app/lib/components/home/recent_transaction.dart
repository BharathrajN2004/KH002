import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'Transaction History',
                size: sizeData.medium,
                color: colorData.fontColor(.6),
                weight: FontWeight.w800,
              ),
              GestureDetector(
                onTap: () {},
                child: CustomIcon(
                  size: sizeData.aspectRatio * 40,
                  icon: Icons.arrow_forward_ios_rounded,
                  color: colorData.fontColor(.8),
                ),
              ),
            ],
          ),
          ...transactionData
              .map(
                (e) => Container(
                  margin: EdgeInsets.only(bottom: height * 0.01),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F2F7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            size: aspectRation * 70,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e["name"].toString(),
                              style: TextStyle(
                                  fontSize: sizeData.regular,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              e["date"].toString(),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: sizeData.small,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          e["iconData"] as IconData?,
                          color: (e["iconData"] as IconData?) ==
                                  Icons.remove_rounded
                              ? Colors.red
                              : Colors.green,
                          size: aspectRation * 60,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          e["amount"].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: sizeData.header,
                              fontWeight: FontWeight.w800),
                        )
                      ]),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
