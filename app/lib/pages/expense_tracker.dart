import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utilities/theme/color_data.dart';
import '../Utilities/theme/size_data.dart';
import '../components/common/text.dart';
import '../components/expense_tracking/chart.dart';
import '../components/expense_tracking/income_expense_field.dart';

class ExpenseTracker extends ConsumerWidget {
  ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Container(
      child: Column(
        children: [
          CustomText(
            text: "ExpenseTracker",
            weight: FontWeight.w600,
            color: colorData.fontColor(.8),
            size: sizeData.header,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomText(
            text: "Current Savings",
            weight: FontWeight.w600,
            color: colorData.fontColor(.5),
            size: sizeData.regular,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Container(
            width: width * 0.24,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorData.fontColor(.1),
            ),
          ),
          SizedBox(
            height: height * 0.006,
          ),
          CustomText(
            text: "₹1,140.5",
            weight: FontWeight.w800,
            color: colorData.fontColor(.8),
            size: sizeData.superHeader,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              Row(children: [
                CustomText(
                  text: "December",
                  weight: FontWeight.w800,
                  size: sizeData.medium,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: colorData.fontColor(.8),
                  size: aspectRatio * 50,
                ),
              ]),
              Spacer(),
              Row(children: [
                CustomText(
                  text: "Week 1",
                  weight: FontWeight.w800,
                  size: sizeData.medium,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: colorData.fontColor(.8),
                  size: aspectRatio * 50,
                ),
              ]),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              IncomeExpenseField(header: "BALANCE", value: 3100),
              Spacer(),
              IncomeExpenseField(header: "SPENT", value: 990.5),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          ),
          Spacer(),
          Chart(),
          Spacer(),
        ],
      ),
    );
  }
}
