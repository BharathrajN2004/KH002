// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../class/user.dart';

class UserDetailNotifier extends StateNotifier<User?> {
  UserDetailNotifier() : super(null);

  void addUserData(User userData) {
    state = userData;
  }
}

final userDataProvider = StateNotifierProvider<UserDetailNotifier, User?>(
    (ref) => UserDetailNotifier());
