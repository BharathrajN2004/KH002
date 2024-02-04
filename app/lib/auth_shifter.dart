import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './providers/user_detail_provider.dart';
import './layouts/navigation.dart';
import 'class/user.dart';
import 'layouts/login&signin.dart';

class AuthShifter extends ConsumerStatefulWidget {
  const AuthShifter({super.key});

  ConsumerState<AuthShifter> createState() => _authShifter();
}

class _authShifter extends ConsumerState<AuthShifter> {

  Future localToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("userData") != null) {
      Map<String, dynamic> data =
          jsonDecode(preferences.getString("userData")!);
      print(data);
      User userData = User(
          token: data["token"],
          id: data["id"],
          name: data["name"],
          email: data["email"],
          password: data["password"],
          phoneNo: int.parse(data["phoneNo"].toString()));

      ref.read(userDataProvider.notifier).addUserData(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: SharedPreferences.getInstance().asStream(),
        builder: (context, snapshot) {
          String? data = snapshot.data!.getString("userData");
          if (data == null || data == "") {
            return AuthPage();
          } else {
            localToken();
            return Navigation();
          }
        });
  }
}
