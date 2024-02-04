import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';

import '../../utilities/static_data.dart';
import '../common/text.dart';

class ExistingGroups extends ConsumerWidget {
  ExistingGroups({
    super.key,
  });

  List groups = [
    {
      "image": "assets/images/group_pics/Domino's_img.png",
      "name": "Domino's Pizza Party",
    },
    {
      "image": "assets/images/group_pics/netflix_img.png",
      "name": "Bingers",
    },
    {
      "image": "assets/images/group_pics/spotify_img.png",
      "name": "Spotify",
    },
    {
      "image": "assets/images/group_pics/kfc_img.png",
      "name": "Friends Forever",
    },
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.01),
              itemCount: groups.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: height * 0.015),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colorData.secondaryColor(.7),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        groups[index]["image"],
                        height: aspectRatio * 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.045,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: groups[index]["name"],
                          weight: FontWeight.w800,
                        ),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
