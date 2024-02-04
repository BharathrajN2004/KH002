// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:app/class/user.dart';
import 'package:app/providers/user_detail_provider.dart';
import 'package:http/http.dart';
import 'package:app/components/common/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utilities/theme/color_data.dart';
import '../Utilities/theme/size_data.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  bool login = true;

  String? errormessage = "";

  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPasswordcontroller = TextEditingController();
  final nameController = TextEditingController();

  String? collectionName;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    phonecontroller.dispose();
    confirmPasswordcontroller.dispose();
    nameController.dispose();
    super.dispose();
  }

  clear() {
    nameController.clear();
    passwordcontroller.clear();
    emailcontroller.clear();
    confirmPasswordcontroller.clear();
    phonecontroller.clear();
  }

  Future<void> signinwithEmailandPassword() async {
    try {
      Response httpResponse =
          await post(Uri.parse("http://192.168.1.40/auth/login/"),
              headers: {"Content-type": "application/json"},
              body: json.encode({
                "email": emailcontroller.text,
                "password": passwordcontroller.text,
              }));
      var data = Map.from(json.decode(httpResponse.body));
      SharedPreferences pref = await SharedPreferences.getInstance();
      Map ofData = {
        "token": data["token"],
        "name": data["user"]["name"],
        "id": data["user"]["_id"],
        "email": data["user"]["email"],
        "password": data["user"]["password"],
        "phoneNo": data["user"]["phoneNo"],
      };
      pref.setString("userData", json.encode(ofData));
      User userData = User(
          token: data["token"],
          name: data["user"]["name"],
          id: data["user"]["_id"],
          email: data["user"]["email"],
          password: data["user"]["password"],
          phoneNo: int.parse(data["user"]["phoneNo"].toString()));
      ref.read(userDataProvider.notifier).addUserData(userData);
    } on HttpException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  Future<void> createUserwithEmailandPassword() async {
    try {
      Response httpResponse =
          await post(Uri.parse("http://192.168.1.40/auth/signup/"),
              headers: {"Content-type": "application/json"},
              body: json.encode({
                "name": nameController.text,
                "email": emailcontroller.text,
                "password": passwordcontroller.text,
                "phoneNo": phonecontroller.text,
              }));
      var data = Map.from(json.decode(httpResponse.body));
      SharedPreferences pref = await SharedPreferences.getInstance();
      Map ofData = {
        "token": data["token"],
        "name": data["user"]["name"],
        "id": data["user"]["_id"],
        "email": data["user"]["email"],
        "password": data["user"]["password"],
        "phoneNo": data["user"]["phoneNo"],
      };
      pref.setString("userData", json.encode(ofData));
      User userData = User(
          token: data["token"],
          name: data["user"]["name"],
          id: data["user"]["_id"],
          email: data["user"]["email"],
          password: data["user"]["password"],
          phoneNo: int.parse(data["user"]["phoneNo"].toString()));
      ref.read(userDataProvider.notifier).addUserData(userData);
    } on HttpException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  String? p;
  Future<void> addUser() async {
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(emailcontroller.text.trim().toLowerCase())
    //     .set(
    //   {
    //     'name': nameController.text.trim(),
    //     'email': emailcontroller.text.trim().toLowerCase(),
    //     'password': passwordcontroller.text.trim(),
    //     'photo': p,
    //     'database': {
    //       'collaborator': [collectionName != null ? collectionName : ""],
    //       'authority': [],
    //       'creator': {
    //         'name': collectionController.text.isNotEmpty
    //             ? collectionController.text.trim()
    //             : "",
    //         'collabpassword':
    //             collabSwitch ? "" : colPasswordcontroller.text.trim()
    //       }
    //     },
    //   },
    // );
  }

  File? imager;

  String? firstemail;

  Future imagepicker(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() => this.imager = tempImage);
      final path = 'photo/${emailcontroller.text.trim()}';
      print(path);
    } on PlatformException catch (e) {
      print('Failed to pick the image');
    }
  }

  snackbar() => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          content: Column(
            children: [
              selector(Icons.camera, "Camera", ImageSource.camera),
              const SizedBox(
                height: 12,
              ),
              selector(Icons.folder, "Gallery", ImageSource.gallery)
            ],
          ),
        ),
      );

  InkWell photo(double height, Image imager, String fromwere) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        snackbar();
      },
      child: Stack(
        children: [
          ClipOval(
            child: imager,
          ),
          fromwere == "image"
              ? const Positioned(
                  bottom: 0,
                  right: 4,
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    color: Colors.greenAccent,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget selector(IconData icon, String field, ImageSource source) {
    return GestureDetector(
      onTap: () => imagepicker(source),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            field,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget shifting(colorData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account?  " : "Have an Existing Account?  ",
          style: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        GestureDetector(
          onTap: () => setState(() {
            login = !login;
            clear();
          }),
          child: Text(
            login ? 'Sign up' : 'Login',
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                color: colorData.primaryColor(.8),
                fontWeight: FontWeight.w600,
                fontFamily: 'Acme'),
          ),
        )
      ],
    );
  }

  void errorShow(check) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 600),
        content: Text(
            check ? 'Kindly add your profile pic' : 'Hum? $errormessage',
            textAlign: TextAlign.center),
      ),
    );
    errormessage = "";
  }

  Widget field(double width, String labeltext, TextEditingController controller,
      TextInputType type, IconData icon, CustomColorData colorData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      width: width * 0.85,
      child: TextField(
        onSubmitted: (value) {
          setState(() {
            if (firstemail != null && controller == emailcontroller) {
              firstemail = null;
            }
          });
        },
        controller: controller,
        cursorColor: colorData.fontColor(1.0),
        scrollPadding: EdgeInsets.zero,
        style: TextStyle(fontSize: width * 0.04),
        keyboardType: type,
        decoration: InputDecoration(
          hintText: labeltext,
          hintStyle: TextStyle(
              color: colorData.fontColor(.5), fontWeight: FontWeight.w500),
          prefixIconColor: colorData.fontColor(.4),
          fillColor: colorData.fontColor(.8),
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            size: width * 0.07,
          ),
        ),
      ),
    );
  }

  Widget align(child) {
    return Align(alignment: Alignment.center, child: child);
  }

  String? chosenCollPassword;
  String? showText;

  @override
  Widget build(BuildContext context) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    double height = sizeData.height;
    double width = sizeData.width;
    return Scaffold(
      backgroundColor: colorData.backgroundColor(1),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.03),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width * 0.25,
                  height: width * 0.25,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: colorData.primaryColor(.2),
                      blurRadius: 30,
                    )
                  ]),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: login ? 'Welcome back to ' : 'Welcome to ',
                    weight: FontWeight.w700,
                    color: colorData.fontColor(.8),
                    size: sizeData.header,
                  ),
                  CustomText(
                    text: ' SplitIt!',
                    color: colorData.primaryColor(1),
                    weight: FontWeight.w800,
                    size: sizeData.superHeader,
                  )
                ],
              ),
              login
                  ? SizedBox(
                      height: height * 0.08,
                    )
                  : SizedBox(
                      height: height * 0.03,
                    ),
              login
                  ? const SizedBox()
                  : imager == null
                      ? Align(
                          alignment: Alignment.center,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              photo(
                                  height,
                                  Image.asset(
                                    'assets/images/profile.png',
                                    height: height * 0.1,
                                  ),
                                  "asset"),
                              const Positioned(
                                bottom: 0,
                                right: -4,
                                child: Icon(
                                  Icons.add_a_photo_rounded,
                                  color: Color.fromRGBO(248, 97, 146, 1),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: photo(
                              height,
                              Image.file(
                                imager!,
                                width: height * 0.1,
                                height: height * 0.1,
                                fit: BoxFit.cover,
                              ),
                              "image"),
                        ),
              login
                  ? const SizedBox()
                  : SizedBox(
                      height: height * 0.03,
                    ),
              login
                  ? const SizedBox()
                  : field(width, 'Enter your name', nameController,
                      TextInputType.text, Icons.person, colorData),
              login
                  ? const SizedBox()
                  : SizedBox(
                      height: height * 0.02,
                    ),
              login
                  ? const SizedBox()
                  : field(width, 'Enter your Mobile Number', phonecontroller,
                      TextInputType.number, Icons.phone_in_talk, colorData),
              SizedBox(
                height: height * 0.02,
              ),
              field(
                  width,
                  'Enter your Email Id',
                  emailcontroller,
                  TextInputType.emailAddress,
                  Icons.mail_outline_rounded,
                  colorData),
              SizedBox(
                height: height * 0.02,
              ),
              field(
                  width,
                  "Enter your password",
                  passwordcontroller,
                  TextInputType.visiblePassword,
                  Icons.password_outlined,
                  colorData),
              SizedBox(
                height: height * 0.025,
              ),
              login
                  ? const SizedBox()
                  : field(
                      width,
                      "Confirm your password",
                      confirmPasswordcontroller,
                      TextInputType.visiblePassword,
                      Icons.lock,
                      colorData),
              SizedBox(
                height: height * 0.025,
              ),
              login
                  ? const SizedBox()
                  : SizedBox(
                      height: height * 0.02,
                    ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if ((errormessage == '' ||
                        errormessage == 'The email is badly formated')) {
                      if (login) {
                        signinwithEmailandPassword();
                      } else {
                        createUserwithEmailandPassword();
                      }
                    } else {
                      errorShow(false);
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        colorData.primaryColor(.2),
                        colorData.primaryColor(.6),
                      ]),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: 10),
                  child: CustomText(
                    text: login ? 'LOGIN' : 'SIGN UP',
                    color: colorData.secondaryColor(1),
                    weight: FontWeight.w600,
                    size: sizeData.regular,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              shifting(colorData),
            ],
          ),
        ),
      ),
    );
  }

  bool collabSwitch = false;
  Widget collabShifter() => FlutterSwitch(
        height: 36,
        width: 66,
        padding: 3,
        value: collabSwitch,
        toggleSize: 32,
        activeColor: const Color.fromARGB(255, 255, 179, 179),
        inactiveColor: const Color.fromARGB(255, 100, 253, 199),
        activeIcon: const Icon(
          Icons.add_business_rounded,
        ),
        inactiveIcon: const Icon(Icons.create),
        onToggle: (val) => setState(
          () {
            collabSwitch = !collabSwitch;
          },
        ),
      );
}
