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
  @override
  Widget build(BuildContext context) {
    var refData = ref.watch(userDataProvider);
    return refData == null
        ? StreamBuilder(
            stream: SharedPreferences.getInstance().asStream(),
            builder: (context, snapshot) {
              if ((snapshot.hasData &&
                  snapshot.data!.getString("userData") != null &&
                  snapshot.data!.getString("userData") != "")) {
                return Navigation();
              } else {
                return AuthPage();
              }
            })
        : Navigator();
  }
}
