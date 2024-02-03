import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/static_data.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../components/common/text.dart';

class Group extends ConsumerWidget {
  Group({super.key});

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
        Align(
          alignment: Alignment.center,
          child: CustomText(
            text: "Groups",
            weight: FontWeight.w600,
            color: colorData.fontColor(.8),
            size: sizeData.header,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorData.secondaryColor(1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // SizedBox(
              //   height: height * 0.04,
              // ),
              Container(
                height: height * 0.045,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(aspectRatio * 14),
                  color: colorData.backgroundColor(1),
                ),
                child: TextField(
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sizeData.regular,
                      height: 1),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: height * 0.008),
                    hintText: "Search for friends",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sizeData.regular,
                      color: colorData.fontColor(.6),
                      height: 1,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: width * 0.01),
                      padding: EdgeInsets.all(aspectRatio * 20),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: aspectRatio * 40,
                      ),
                    ),
                  ),
                  scrollPadding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: height * 0.1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.01),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: width * 0.05, bottom: height * 0.015),
                            padding: EdgeInsets.all(
                              aspectRatio * 3,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorData.secondaryColor(1),
                            ),
                            child: Image.asset(
                              "assets/images/avatars/avatar2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: -4,
                            left: -3,
                            child: SizedBox(
                              width: width * .16,
                              child: CustomText(
                                text: "namesdf",
                                weight: FontWeight.w800,
                                size: sizeData.tooSmall,
                                color: colorData.fontColor(.5),
                                align: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CreateGroup(),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.025,
        ),
        CustomText(
          text: "Existing Groups",
          size: sizeData.medium,
          color: colorData.fontColor(.6),
          weight: FontWeight.w800,
        ),
        SizedBox(
          height: height * 0.015,
        ),
        Container(
          height: height * 0.045,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(aspectRatio * 14),
            color: colorData.secondaryColor(1),
          ),
          child: TextField(
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: sizeData.regular,
                height: 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: height * 0.008),
              hintText: "Search for groups",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: sizeData.regular,
                color: colorData.fontColor(.6),
                height: 1,
              ),
              border: InputBorder.none,
              prefixIcon: Container(
                margin: EdgeInsets.only(left: width * 0.01),
                padding: EdgeInsets.all(aspectRatio * 20),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: aspectRatio * 40,
                ),
              ),
            ),
            scrollPadding: EdgeInsets.zero,
          ),
        ),
        Expanded(child: Container(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
            itemCount: 10,
            itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: height*0.015),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.008,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colorData.secondaryColor(1),
              ),
              child: Row(children: [
                SizedBox(
                  width: width * 0.02,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/avatars/avatar3.png",
                    height: aspectRatio * 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Friends forever"),
                    SizedBox(
                      height: height * 0.008,
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
                )
              ]),
            );
          }),
        ))
      ],
    );
  }
}

class CreateGroup extends ConsumerStatefulWidget {
  const CreateGroup({
    super.key,
  });

  ConsumerState<CreateGroup> createState() => _createGroup();
}

class _createGroup extends ConsumerState<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Container(
      margin: EdgeInsets.only(bottom: height * 0.029),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height * 0.15,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.017,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: colorData.primaryColor(.4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: "Create Group",
                  weight: FontWeight.w700,
                  size: sizeData.medium,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.07,
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_new_rounded),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                              left: width * 0.015,
                              right: width * 0.015,
                              top: height * 0.007,
                              bottom: height * 0.007,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 13,
                            itemBuilder: (context, index) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: width * 0.025),
                                    padding: EdgeInsets.all(aspectRatio * 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: avatarColors[1],
                                    ),
                                    child: Image.asset(
                                      "assets/images/avatars/avatar1.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    top: -5,
                                    right: 10,
                                    child: Container(
                                      padding: EdgeInsets.all(aspectRatio * 8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorData.fontColor(1),
                                      ),
                                      child: FaIcon(
                                        FontAwesomeIcons.xmark,
                                        size: aspectRatio * 22,
                                        color: colorData.secondaryColor(1),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: colorData.fontColor(.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -height * 0.042,
            left: 0,
            right: 0,
            child: Container(
              height: aspectRatio * 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorData.secondaryColor(1),
              ),
            ),
          ),
          Positioned(
            bottom: -height * 0.025,
            left: 0,
            right: 0,
            child: Container(
              height: aspectRatio * 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorData.fontColor(.8),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: aspectRatio * 40,
                  color: colorData.secondaryColor(1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -height * 0.018,
            left: 0,
            child: Container(
              width: width * 0.332,
              height: height * 0.018,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: colorData.primaryColor(.4),
              ),
            ),
          ),
          Positioned(
            bottom: -height * 0.018,
            right: 0,
            child: Container(
              width: width * 0.332,
              height: height * 0.018,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: colorData.primaryColor(.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
