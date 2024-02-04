import 'package:app/components/profile/color_palette.dart';
import 'package:app/components/profile/upis.dart';
import 'package:app/providers/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../class/user.dart';
import '../components/common/profile_tile.dart';
import '../components/common/theme_toggle.dart';
import '../components/profile/bank_accounts.dart';
import '../components/profile/saved_cards.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../components/common/text.dart';

class Profile extends ConsumerWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? userData = ref.watch(userDataProvider);
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.06,
            right: width * 0.06,
          ),
          color: colorData.backgroundColor(1),
          child: Column(
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
                height: height * 0.01,
              ),
              Container(
                height: height * 0.125,
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
              SizedBox(height: height * 0.01),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomText(
                    text: userData!.name[0].toUpperCase() +
                        userData.name.substring(1),
                    size: sizeData.header,
                    weight: FontWeight.w800,
                    color: colorData.fontColor(.8),
                  ),
                  Positioned(
                    right: -width * 0.1,
                    child: GestureDetector(
                      child: Icon(Icons.edit_outlined),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.005),
              CustomText(
                text: userData.email,
                size: sizeData.regular,
                color: colorData.fontColor(.6),
              ),
              SizedBox(height: height * 0.005),
              CustomText(
                text: userData.phoneNo.toString(),
                size: sizeData.regular,
                color: colorData.fontColor(.6),
              ),
              // const ColorPalette(),
              SizedBox(height: height * 0.01),
              BankAccounts(),
              SizedBox(height: height * 0.01),
              SavedCards(),
              SizedBox(height: height * 0.01),
              Upis(),
              SizedBox(
                height: height * 0.02,
              ),
              ProfileTile(
                  text: 'Help', icon: Icons.help_outline_outlined, todo: () {}),
              SizedBox(
                height: height * 0.02,
              ),
              ProfileTile(
                text: 'Logout',
                icon: Icons.logout_outlined,
                todo: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  ref.read(userDataProvider.notifier).addUserData(User.empty());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
