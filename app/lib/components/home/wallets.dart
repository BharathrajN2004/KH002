import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/size_data.dart';
import 'wallet.dart';

class Wallets extends ConsumerWidget {
  Wallets({
    super.key,
  });
  int firstIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);

    double height = sizeData.height;
    double width = sizeData.width;

    return SizedBox(
      width: width,
      height: height * 0.225,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Wallet(isFirst: firstIndex == index);
          }),
    );
  }
}
