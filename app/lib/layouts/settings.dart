import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/common/profile_tile.dart';
import '../components/common/theme_toggle.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../components/common/text.dart';

class Settings extends ConsumerWidget {
  Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ThemeToggle(),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            height: height * 0.15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/avatars/avatar1.png',
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          CustomText(
            text: "Sharjun",
            size: sizeData.header,
            weight: FontWeight.w800,
            color: colorData.fontColor(.8),
          ),
          SizedBox(height: height * 0.005),
          CustomText(
            text: "sharjun@gmail.com",
            size: sizeData.regular,
            color: colorData.fontColor(.6),
          ),
          SizedBox(height: height * 0.05),
          // const ColorPalette(),
          ProfileTile(
              text: 'Edit Profile', icon: Icons.edit_outlined, todo: () {}),
          SizedBox(
            height: height * 0.03,
          ),
          ProfileTile(
              text: 'Help', icon: Icons.help_outline_outlined, todo: () {}),
          SizedBox(
            height: height * 0.03,
          ),
          ProfileTile(text: 'History', icon: Icons.history, todo: () {}),
          SizedBox(
            height: height * 0.03,
          ),
          ProfileTile(
            text: 'Logout',
            icon: Icons.logout_outlined,
            todo: () {
              // AuthFB().signOut();
              // ref.read(navigationIndexProvider.notifier).jumpTo(0);
            },
          ),
        ],
      );
  }
}
