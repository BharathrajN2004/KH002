import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class BankAccounts extends ConsumerWidget {
  BankAccounts({super.key});

  List banks = [
    {
      "image": "assets/images/payment_options/Banks/sbi.png",
      "name": "State Bank of India",
    },
    {
      "image": "assets/images/payment_options/Banks/icici.png",
      "name": "ICICI Bank",
    },
    {
      "image": "assets/images/payment_options/Banks/kotak.png",
      "name": "Kotak Mahindra Bank",
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
            text: 'BANK ACCOUTS',
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
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width * .225,
                        margin: EdgeInsets.only(
                            bottom: height * 0.01, right: width * 0.04),
                        padding: EdgeInsets.all(aspectRation * 12),
                        decoration: BoxDecoration(
                          color: colorData.secondaryColor(1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width,
                                height: height * .06,
                                padding: EdgeInsets.all(aspectRation * 8),
                                decoration: BoxDecoration(
                                  color: colorData.primaryColor(.05),
                                  borderRadius: BorderRadius.circular(8),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Image.asset(
                                  banks[index]["image"],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.003,
                              ),
                              Expanded(
                                child: CustomText(
                                  text: banks[index]["name"],
                                  size: sizeData.tooSmall,
                                  weight: FontWeight.w700,
                                  color: colorData.fontColor(.8),
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
