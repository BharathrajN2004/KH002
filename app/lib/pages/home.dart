import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utilities/static_data.dart';
import '../components/home/groups.dart';
import '../components/home/header.dart';
import '../components/home/payments.dart';
import '../components/home/recent_contacts.dart';
import '../components/home/recent_split.dart';
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
              const RecentContacts(),
              SizedBox(
                height: height * 0.03,
              ),
              const RecentSplit(),
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
