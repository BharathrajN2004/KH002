import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth_shifter.dart';
import '../components/obscreen/Bubble.dart';
import '../components/obscreen/DATA.dart';
import '../components/obscreen/NavigatorIndicator.dart';
import 'navigation.dart';

class OBScreen extends StatefulWidget {
  const OBScreen({super.key});

  @override
  State<OBScreen> createState() => _OBScreenState();
}

class _OBScreenState extends State<OBScreen> {
  int currentView = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  setIsFirstTimeView() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isFirstTimeView', false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(
            top: height * 0.04,
            left: width * 0.04,
            right: width * 0.04,
          ),
          color: Color(0XFF252B32),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavigatorIndicator(
                      width: width,
                      height: height,
                      index: 0,
                      isSelected: currentView == 0,
                    ),
                    NavigatorIndicator(
                      width: width,
                      height: height,
                      index: 1,
                      isSelected: currentView == 1,
                    ),
                    NavigatorIndicator(
                      width: width,
                      height: height,
                      index: 2,
                      isSelected: currentView == 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  itemCount: 3,
                  onPageChanged: (int value) {
                    setState(() {
                      currentView = value;
                    });
                  },
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Text(
                          headerText[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Khyay',
                              fontSize: width * 0.065,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Stack(children: [
                            Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                            ),
                            ...bubbleGenerator(height, width, 4),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setIsFirstTimeView();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthShifter()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  backgroundColor: const Color.fromRGBO(40, 40, 40, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    fontFamily: 'Khyay',
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.04,
                    color: Colors.white.withOpacity(.7),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Bubble> bubbleGenerator(double height, double width, int count) {
    List<Bubble> bubbles = [];
    List<Color> colorList = const [
      Color.fromRGBO(22, 254, 154, 1),
      Color.fromRGBO(255, 135, 120, 1),
      Color.fromRGBO(86, 123, 255, 1),
    ];

    for (int i = 0; i < count; i++) {
      Bubble bubble = Bubble(
        top: height * (0.02 + Random().nextDouble() * 0.25),
        left: width * (0.05 + Random().nextDouble() * 0.8),
        color: colorList[currentView]
            .withOpacity(0.4 + Random().nextDouble() * 0.6),
      );
      bubbles.add(bubble);
    }

    return bubbles;
  }
}
