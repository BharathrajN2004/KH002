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
      var userData = jsonDecode(preferences.getString("userData")!);
      ref.read(userDataProvider.notifier).addUserData(userData);
    }
  }

  @override
  void initState() {
    super.initState();
    localToken();
  }

  @override
  Widget build(BuildContext context) {
    User? token = ref.watch(userDataProvider);
    if (token == null) {
      return AuthPage();
    } else {
      return Navigation();
    }
  }
}
