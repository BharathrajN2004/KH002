import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/expense_tracker.dart';
import '../pages/fundraiser.dart';
import '../pages/group.dart';
import '../pages/nft.dart';
import '../providers/navigation_index_provider.dart';
import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';

import '../pages/home.dart';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  int navigationIndex = 0;

  List<Widget> widgetStack = [
    Home(),
    Group(),
    ExpenseTracker(),
    // NFTPage(),
    FundRaiser(),
  ];

  List<IconData> navBarChildren = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.chartSimple,
    // FontAwesomeIcons.moneyBillTrendUp,
    FontAwesomeIcons.handHoldingHeart,
  ];

  @override
  Widget build(BuildContext context) {
    navigationIndex = ref.watch(navigationIndexProvider);
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorData.backgroundColor(1),
      body: Container(
        padding: EdgeInsets.only(
          top: height * 0.02,
          left: width * 0.06,
          right: width * 0.06,
        ),
        decoration: BoxDecoration(
          color: colorData.backgroundColor(1),
        ),
        child: SafeArea(
          child: IndexedStack(index: navigationIndex, children: widgetStack),
        ),
      ),
      bottomNavigationBar: Container(
        height: sizeData.height * 0.07,
        padding: EdgeInsets.only(
          left: sizeData.width * 0.01,
          right: sizeData.width * 0.01,
          bottom: sizeData.height * 0.005,
        ),
        color: colorData.bottomNavBarColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navBarChildren.map(
              (e) {
                int currentIndex = navBarChildren.indexOf(e);
                return GestureDetector(
                  onTap: () => setState(() {
                    ref
                        .read(navigationIndexProvider.notifier)
                        .jumpTo(currentIndex);
                  }),
                  child: Container(
                    color: colorData.bottomNavBarColor,
                    padding: EdgeInsets.only(
                      left: sizeData.aspectRatio * 10,
                      right: sizeData.aspectRatio * 10,
                    ),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: sizeData.aspectRatio * 60,
                          height: 3,
                          decoration: navigationIndex == currentIndex
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      colorData.bottomNavBarColor,
                                      colorData.primaryColor(.6),
                                      colorData.primaryColor(.8),
                                      colorData.primaryColor(.6),
                                      colorData.bottomNavBarColor
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                )
                              : const BoxDecoration(),
                        ),
                        SizedBox(
                          height: sizeData.height * 0.01,
                        ),
                        AnimatedContainer(
                          width: width * 0.15,
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          duration: const Duration(milliseconds: 600),
                          child: Center(
                            child: FaIcon(
                              e,
                              size: sizeData.aspectRatio *
                                  (navigationIndex == currentIndex ? 50 : 47),
                              color: colorData.primaryColor(
                                  navigationIndex == currentIndex ? 1 : .2),
                              shadows: [
                                BoxShadow(
                                  color: colorData.primaryColor(
                                      navigationIndex == currentIndex
                                          ? .4
                                          : .15),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList()),
      ),
    );
  }
}
