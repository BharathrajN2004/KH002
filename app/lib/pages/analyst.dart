import 'package:flutter/material.dart';

import '../components/common/text.dart';

class Analyst extends StatelessWidget {
  Analyst({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(text: "Analyst"),
        ],
      ),
    );
  }
}
