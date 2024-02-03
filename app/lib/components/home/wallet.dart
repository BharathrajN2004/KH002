import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/theme/size_data.dart';
import '../common/text.dart';

class Wallet extends ConsumerWidget {
  const Wallet({
    super.key,
    required this.isFirst,
  });

  final bool isFirst;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.0175,
      ),
      margin: EdgeInsets.symmetric(
        vertical: height * (isFirst ? 0.0165 : 0.02),
        horizontal: width * 0.03,
      ),
      width: isFirst ? width * 0.7 : width * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF3876EA),
                Color(0xFF980EFB),
              ]),
          boxShadow: isFirst
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
                  size: aspectRatio * 50,
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: FaIcon(
                  FontAwesomeIcons.wifi,
                  size: aspectRatio * 38,
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
                width: width * 0.01,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "VALID",
                size: aspectRatio * 16,
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
  }
}
