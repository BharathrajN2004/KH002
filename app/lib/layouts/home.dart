import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utilities/static_data.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../components/common/text.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int firstIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CustomText(
                      text: "Hey ",
                      size: sizeData.subHeader,
                      color: colorData.fontColor(.5),
                    ),
                    CustomText(
                      text: "Bharath!",
                      size: sizeData.header,
                      color: colorData.fontColor(.8),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: sizeData.aspectRatio * 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.solidBell,
                        size: sizeData.aspectRatio * 55,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -7,
                    right: 4,
                    child: Container(
                      width: sizeData.aspectRatio * 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.shade100,
                      ),
                      child: Center(
                        child: CustomText(
                          text: "2",
                          size: sizeData.tooSmall,
                          weight: FontWeight.w800,
                          color: colorData.fontColor(1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: sizeData.width * 0.03,
              ),
              Container(
                padding: EdgeInsets.all(
                  sizeData.aspectRatio * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorData.bottomNavBarColor,
                ),
                child: Image.asset(
                  "assets/images/avatars/avatar1.png",
                  width: sizeData.aspectRatio * 90,
                  height: sizeData.aspectRatio * 90,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizeData.height * 0.02,
          ),
          // CustomText(
          //   text: "Your Cards",
          //   size: sizeData.subHeader,
          //   color: colorData.fontColor(.8),
          //   weight: FontWeight.w800,
          // ),
          // SizedBox(
          //   height: sizeData.height * 0.001,
          // ),
          // CustomText(
          //   text: "Your have 3 active cards",
          //   size: sizeData.small,
          //   color: colorData.fontColor(.5),
          // ),
          // SizedBox(
          //   height: sizeData.height * 0.01,
          // ),
          Container(
            width: sizeData.width,
            height: sizeData.height * 0.225,
            child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: sizeData.width * 0.01),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeData.width * 0.04,
                      vertical: sizeData.height * 0.0175,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: sizeData.height *
                          (index == firstIndex ? 0.0165 : 0.02),
                      horizontal: sizeData.width * 0.03,
                    ),
                    width: index == firstIndex
                        ? sizeData.width * 0.7
                        : sizeData.width * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFF3876EA),
                              Color(0xFF980EFB),
                            ]),
                        boxShadow: index == firstIndex
                            ? [
                                BoxShadow(
                                  color: Color(0xFF3876EA).withOpacity(.4),
                                  blurRadius: 10,
                                  offset: Offset(-4, 2),
                                ),
                                BoxShadow(
                                  color: Color(0xFF980EFB).withOpacity(.4),
                                  blurRadius: 10,
                                  offset: Offset(4, 2),
                                ),
                              ]
                            : []),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: FaIcon(
                                FontAwesomeIcons.simCard,
                                size: sizeData.aspectRatio * 50,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: FaIcon(
                                FontAwesomeIcons.wifi,
                                size: sizeData.aspectRatio * 38,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "8723",
                              size: sizeData.medium,
                              color: Colors.white70,
                              weight: FontWeight.w500,
                            ),
                            CustomText(
                              text: "****",
                              size: sizeData.medium,
                              color: Colors.white70,
                            ),
                            CustomText(
                              text: "****",
                              size: sizeData.medium,
                              color: Colors.white70,
                            ),
                            CustomText(
                              text: "2873",
                              size: sizeData.medium,
                              color: Colors.white60,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: sizeData.width * 0.01,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "VALID",
                              size: sizeData.aspectRatio * 16,
                              color: Colors.white30,
                            ),
                            CustomText(
                              text: "09/24",
                              size: sizeData.verySmall,
                              color: Colors.white54,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "INAYAT NAQVI",
                              color: Colors.white70,
                              weight: FontWeight.w400,
                            ),
                            CustomText(
                              text: "VISA",
                              color: Colors.white70,
                              weight: FontWeight.w800,
                              size: sizeData.subHeader,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: sizeData.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(sizeData.aspectRatio * 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFF3EFFB),
                    ),
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: colorData.fontColor(.6),
                      size: sizeData.aspectRatio * 45,
                    ),
                  ),
                  SizedBox(
                    height: sizeData.height * 0.005,
                  ),
                  CustomText(
                    text: "QR Scan",
                    color: colorData.fontColor(.5),
                    size: sizeData.tooSmall,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(sizeData.aspectRatio * 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFF3EFFB),
                    ),
                    child: Icon(
                      Icons.receipt_long,
                      color: colorData.fontColor(.6),
                      size: sizeData.aspectRatio * 45,
                    ),
                  ),
                  SizedBox(
                    height: sizeData.height * 0.005,
                  ),
                  CustomText(
                    text: "Bill Payments",
                    color: colorData.fontColor(.5),
                    size: sizeData.tooSmall,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(sizeData.aspectRatio * 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFF3EFFB),
                    ),
                    child: Icon(
                      Icons.contacts,
                      color: colorData.fontColor(.6),
                      size: sizeData.aspectRatio * 45,
                    ),
                  ),
                  SizedBox(
                    height: sizeData.height * 0.005,
                  ),
                  CustomText(
                    text: "Contacts",
                    color: colorData.fontColor(.5),
                    size: sizeData.tooSmall,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(sizeData.aspectRatio * 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFF3EFFB),
                    ),
                    child: Icon(
                      Icons.account_balance,
                      color: colorData.fontColor(.6),
                      size: sizeData.aspectRatio * 45,
                    ),
                  ),
                  SizedBox(
                    height: sizeData.height * 0.005,
                  ),
                  CustomText(
                    text: "Bank",
                    color: colorData.fontColor(.5),
                    size: sizeData.tooSmall,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: sizeData.height * 0.02,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeData.width * 0.01),
            padding: EdgeInsets.only(
              left: sizeData.width * 0.01,
              top: sizeData.height * 0.01,
              bottom: sizeData.height * 0.005,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color(0xFFF0EBFF),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: sizeData.width * 0.03,
                      right: sizeData.width * 0.04,
                      top: sizeData.height * 0.01,
                      bottom: sizeData.height * 0.005),
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
                  width: sizeData.width,
                  height: sizeData.height * 0.12,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeData.width * 0.04,
                          vertical: sizeData.height * 0.01),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: avatarColors.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: sizeData.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: sizeData.height * 0.008),
                                padding:
                                    EdgeInsets.all(sizeData.aspectRatio * 18),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: avatarColors[index],
                                ),
                                child: Image.asset(
                                  "assets/images/avatars/avatar${6 + index}.png",
                                  width: sizeData.aspectRatio * 62,
                                  height: sizeData.aspectRatio * 62,
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
          ),
          SizedBox(
            height: sizeData.height * 0.03,
          ),
          CustomText(
            text: "  RECENT SPLIT",
            size: sizeData.regular,
            color: colorData.fontColor(.4),
            weight: FontWeight.w500,
          ),
          SizedBox(
            height: sizeData.height * 0.015,
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeData.height * 0.015),
            padding: EdgeInsets.symmetric(
                horizontal: sizeData.width * 0.02,
                vertical: sizeData.height * 0.005),
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
                        height: sizeData.height * 0.0075,
                      ),
                      CustomText(
                        text: "Total Payment INR 996.00",
                        size: sizeData.verySmall,
                        weight: FontWeight.w700,
                        color: colorData.fontColor(.4),
                      ),
                      SizedBox(
                        height: sizeData.height * 0.0075,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.all(sizeData.aspectRatio * 8),
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
                              width: sizeData.aspectRatio * 40,
                              height: sizeData.aspectRatio * 40,
                            ),
                          ),
                          Positioned(
                            left: sizeData.aspectRatio * 40,
                            child: Container(
                              padding: EdgeInsets.all(sizeData.aspectRatio * 8),
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
                                width: sizeData.aspectRatio * 40,
                                height: sizeData.aspectRatio * 40,
                              ),
                            ),
                          ),
                          Positioned(
                            left: (sizeData.aspectRatio * 40) * 2,
                            child: Container(
                              padding: EdgeInsets.all(sizeData.aspectRatio * 8),
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
                                width: sizeData.aspectRatio * 40,
                                height: sizeData.aspectRatio * 40,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: sizeData.width * 0.03),
                    child: Stack(
                      children: [
                        CircularProgressIndicator(
                          value: .33,
                          backgroundColor: colorData.primaryColor(.1),
                          color: colorData.primaryColor(1),
                          strokeCap: StrokeCap.round,
                          strokeWidth: sizeData.aspectRatio * 9,
                          strokeAlign: sizeData.aspectRatio * 5,
                        ),
                        Positioned(
                          top: sizeData.aspectRatio * 8,
                          left: sizeData.aspectRatio * 14,
                          child: CustomText(
                            text: "33%",
                            size: sizeData.small,
                            color: colorData.fontColor(.6),
                            weight: FontWeight.w800,
                          ),
                        ),
                        Positioned(
                          top: sizeData.aspectRatio * 40,
                          left: sizeData.aspectRatio * 14,
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
                ]),
          ),
        ],
      ),
    );
  }
}
