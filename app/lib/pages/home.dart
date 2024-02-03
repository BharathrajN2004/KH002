import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utilities/static_data.dart';
import '../components/home/groups.dart';
import '../components/home/header.dart';
import '../components/home/payments.dart';
import '../components/home/recent_transaction.dart';
import '../components/home/wallets.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../components/common/text.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(),
        SizedBox(
          height: height * 0.02,
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Wallets(),
              SizedBox(
                height: height * 0.01,
              ),
              const Payments(),
              SizedBox(
                height: height * 0.02,
              ),
              RecentContacts(width: width, height: height, sizeData: sizeData, colorData: colorData, aspectRatio: aspectRatio),
              SizedBox(
                height: height * 0.03,
              ),
              GroupList(),
              SizedBox(
                height: height * 0.015,
              ),
              CustomText(
                text: "  RECENT SPLIT",
                size: sizeData.regular,
                color: colorData.fontColor(.4),
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                margin: EdgeInsets.only(bottom: height * 0.015),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.005),
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
              RecentTransaction(),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecentContacts extends StatelessWidget {
  const RecentContacts({
    super.key,
    required this.width,
    required this.height,
    required this.sizeData,
    required this.colorData,
    required this.aspectRatio,
  });

  final double width;
  final double height;
  final CustomSizeData sizeData;
  final CustomColorData colorData;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      padding: EdgeInsets.only(
        left: width * 0.01,
        top: height * 0.01,
        bottom: height * 0.005,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Color(0xFFF0EBFF),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.01),
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
                          margin:
                              EdgeInsets.only(bottom: height * 0.008),
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
