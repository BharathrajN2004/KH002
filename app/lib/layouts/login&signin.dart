// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool login = true;

  String? errormessage = "";

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final nameController = TextEditingController();
  final collectionController = TextEditingController();
  final colPasswordcontroller = TextEditingController();

  String? collectionName;
  var fontcolor = (opacity) => Color.fromRGBO(48, 40, 76, opacity);
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    nameController.dispose();
    collectionController.dispose();
    colPasswordcontroller.dispose();
    super.dispose();
  }

  clear() {
    nameController.clear();
    passwordcontroller.clear();
    emailcontroller.clear();
    collectionController.clear();
    colPasswordcontroller.clear();
  }

  Future<void> signinwithEmailandPassword() async {
    // try {
    //   await auth().signinWithEmailandPassword(
    //       email: emailcontroller.text.trim(),
    //       password: passwordcontroller.text.trim());
    // } on FirebaseAuthException catch (e) {
    //   setState(() {
    //     errormessage = e.message;
    //   });
    // }
  }

  Future<void> createUserwithEmailandPassword() async {
    // try {
    //   await auth().createUserWithEmailandPassword(
    //       email: emailcontroller.text.trim(),
    //       password: passwordcontroller.text.trim());
    // } on FirebaseAuthException catch (e) {
    //   setState(() {
    //     errormessage = e.message;
    //   });
    // }
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

  Future collectioncreation() async {
    final email = emailcontroller.text.trim();

    if (collectionController.text.isNotEmpty) {
      // FirebaseFirestore.instance
      //     .collection('database')
      //     .doc(collectionController.text.trim())
      //     .set({
      //   "authority": [email],
      //   "collaborator": [email],
      //   "creator": {
      //     "email": email,
      //     "name": nameController.text.trim(),
      //     "specialAccess": email,
      //     'date': DateTime.now().toLocal(),
      //     'password': colPasswordcontroller.text.trim(),
      //   }
      // });
    } else {
      // final docref = await FirebaseFirestore.instance
      //     .collection('database')
      //     .doc(collectionName)
      //     .get();
      // List collabs = docref
      //     .data()!
      //     .entries
      //     .firstWhere((element) => element.key == "collaborator")
      //     .value;
      // collabs.add(email);
      // FirebaseFirestore.instance
      //     .collection('database')
      //     .doc(collectionName)
      //     .set({"collaborator": collabs}, SetOptions(merge: true));
    }
  }

  File? imager;

  String? firstemail;

  Future imagepicker(ImageSource source) async {
    // try {
    //   final image = await ImagePicker().pickImage(source: source);
    //   if (image == null) return;
    //   final tempImage = File(image.path);
    //   setState(() => this.imager = tempImage);
    //   final path = 'photo/${emailcontroller.text.trim()}';
    //   print(path);
    //   final ref = FirebaseStorage.instance.ref().child(path).putFile(imager!);
    //   final oncomple = await ref.whenComplete(() => {});
    //   p = await oncomple.ref.getDownloadURL();
    //   print(p);
    // } on PlatformException catch (e) {
    //   print('Failed to pick the image');
    // }
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
        if (emailcontroller.text.isEmpty) {
          setState(() {
            firstemail = "Please enter the email first";
          });
        } else {
          snackbar();
        }
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

  Widget shifting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Dont have an Account?  ' : 'Have an Existing Account?  ',
          style: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        GestureDetector(
          onTap: () => setState(() {
            login = !login;
            clear();
          }),
          child: Text(
            login ? 'Signin' : 'Login',
            style: const TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                color: Color.fromRGBO(248, 97, 146, 1),
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
      TextInputType type, IconData icon) {
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
        cursorColor: fontcolor(1.0),
        scrollPadding: EdgeInsets.zero,
        style: TextStyle(fontSize: width * 0.04),
        keyboardType: type,
        decoration: InputDecoration(
          hintText: labeltext,
          hintStyle:
              TextStyle(color: fontcolor(.5), fontWeight: FontWeight.w500),
          prefixIconColor: fontcolor(.4),
          fillColor: fontcolor(.8),
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
    final color = Color.fromRGBO(239, 239, 255, 1);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.03),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: width * 0.25,
                height: width * 0.25,
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    login ? 'Welcome back! to ' : 'Welcome to ',
                    style: TextStyle(
                        fontFamily: 'Singni',
                        wordSpacing: 6,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 53, 53, 53)),
                  ),
                  Text(
                    ' incubateQR'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Singni',
                        wordSpacing: 6,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(248, 97, 146, 1)),
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
                                    'assets/icons/profile.png',
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
                      TextInputType.text, Icons.person),
              login
                  ? const SizedBox()
                  : SizedBox(
                      height: height * 0.02,
                    ),
              field(
                width,
                'Enter your Email Id',
                emailcontroller,
                TextInputType.emailAddress,
                Icons.mail_outline_rounded,
              ),
              firstemail == null
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.05),
                        child: Text(
                          firstemail!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 73, 134)),
                        ),
                      )),
              SizedBox(
                height: height * 0.02,
              ),
              field(width, "Enter your password", passwordcontroller,
                  TextInputType.visiblePassword, Icons.password_outlined),
              SizedBox(
                height: height * 0.025,
              ),
              login
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            collabSwitch = false;
                          }),
                          child: Text(
                            'CREATE',
                            style: TextStyle(
                                color: collabSwitch
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 0, 170, 111),
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        collabShifter(),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            collabSwitch = true;
                          }),
                          child: Text(
                            "JOIN        ",
                            style: TextStyle(
                                color: collabSwitch
                                    ? const Color.fromARGB(255, 255, 93, 93)
                                    : const Color.fromARGB(255, 180, 180, 180),
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04),
                          ),
                        )
                      ],
                    ),
              login
                  ? const SizedBox()
                  : SizedBox(
                      height: height * 0.02,
                    ),
              login
                  ? const SizedBox()
                  : Column(
                      children: [
                        Text(
                          collabSwitch
                              ? "Choose the Collection"
                              : "Create an Collection",
                          style: TextStyle(
                              fontSize: width * 0.0425,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 48, 48, 48)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                       
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          width: width * 0.85,
                          child: TextField(
                            controller: colPasswordcontroller,
                            cursorColor: fontcolor(1.0),
                            scrollPadding: EdgeInsets.zero,
                            style: TextStyle(fontSize: width * 0.04),
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              setState(
                                () {
                                  if (collabSwitch) {
                                    if (value.toString() ==
                                        chosenCollPassword) {
                                      showText = null;
                                    } else {
                                      showText =
                                          "Entered Password is incorrect";
                                    }
                                  }
                                },
                              );
                            },
                            decoration: InputDecoration(
                              hintText: "Enter collection password",
                              hintStyle: TextStyle(
                                  color: fontcolor(.5),
                                  fontWeight: FontWeight.w500),
                              prefixIconColor: fontcolor(.4),
                              fillColor: fontcolor(.8),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                size: width * 0.07,
                              ),
                            ),
                          ),
                        ),
                        showText != null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  showText!,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.035),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: height * 0.03,
                        ),
                      ],
                    ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if ((errormessage == '' ||
                        errormessage == 'The email is badly formated')) {
                      if (login) {
                        signinwithEmailandPassword();
                        print('done');
                      } else if (p == null) {
                        errorShow(true);
                      } else {
                        // if (collabSwitch
                        //     ? collectionName != null &&
                        //         colPasswordcontroller.text.isNotEmpty
                        //     : collectionController.text.isNotEmpty &&
                        //         colPasswordcontroller.text.isNotEmpty) {
                        //   //
                        //   final collectionProvider =
                        //       Provider.of<CollectionProvider>(context,
                        //           listen: false);
                        //   collectionProvider.toggleCollection(
                        //       collection: collabSwitch
                        //           ? collectionName!
                        //           : collectionController.text.trim(),
                        //       Collectionaccess: collabSwitch
                        //           ? "collaborator"
                        //           : "specialAccess");
                        //   print(collectionProvider.collectionName);
                        //   createUserwithEmailandPassword();
                        //   addUser();
                        //   collectioncreation();
                        //   print('object');
                        // }
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
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(255, 211, 223, 1),
                        Color.fromRGBO(255, 161, 191, 1)
                      ]),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: 10),
                  child: Text(
                    login ? 'LOGIN' : 'SIGNIN',
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 63, 63, 63)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              shifting(),
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
