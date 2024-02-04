import 'package:app/components/group/group_forum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/static_data.dart';
import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

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
          // Positioned(
          //   bottom: -height * 0.042,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: aspectRatio * 130,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: colorData.secondaryColor(1),
          //     ),
          //   ),
          // ),
          Positioned(
            bottom: -height * 0.04,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        alignment: Alignment.center,
                        content: Container(
                          height: height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Enter Group Name",
                                weight: FontWeight.w700,
                                size: sizeData.header,
                                color: colorData.fontColor(.8),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextField(),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GroupForum()));
                                  }),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.01,
                                        horizontal: width * 0.035),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorData.primaryColor(.6),
                                    ),
                                    child: CustomText(
                                      text: "Create",
                                      color: colorData.secondaryColor(1),
                                      weight: FontWeight.w800,
                                      size: sizeData.medium,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.01,
                                        horizontal: width * 0.035),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorData.fontColor(.3),
                                    ),
                                    child: CustomText(
                                      text: "Cancel",
                                      color: colorData.secondaryColor(1),
                                      weight: FontWeight.w800,
                                      size: sizeData.medium,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // actions: [
                        //   CustomText(text: "Enter Group Name"),
                        //   TextField(),
                        //   Container(
                        //     child: CustomText(text: "Create"),
                        //   )
                        // ],
                      );
                    });
              },
              child: Container(
                height: aspectRatio * 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorData.secondaryColor(1),
                ),
                child: Center(
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
              ),
            ),
          ),
          Positioned(
            bottom: -height * 0.018,
            left: 0,
            child: Container(
              width: width * 0.331,
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
              width: width * 0.331,
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
