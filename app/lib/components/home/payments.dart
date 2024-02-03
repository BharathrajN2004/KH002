import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/theme/color_data.dart';
import '../../utilities/theme/size_data.dart';
import 'payment_option.dart';

class Payments extends ConsumerWidget {
  const Payments({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    double aspectRatio = sizeData.aspectRatio;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PaymentOption(
            text: "QR Scan", icon: Icons.qr_code_rounded, todo: () {}),
        PaymentOption(
            text: "Bill payment",
            icon: Icons.receipt_long_rounded,
            todo: () {}),
        PaymentOption(text: "Contacts", icon: Icons.contacts, todo: () {}),
        PaymentOption(text: "Bank Transfer", icon: Icons.account_balance, todo: () {}),
      ],
    );
  }
}
