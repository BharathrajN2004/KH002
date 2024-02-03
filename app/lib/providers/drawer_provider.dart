import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationKeyNotifier extends StateNotifier<GlobalKey<ScaffoldState>> {
  NavigationKeyNotifier() : super(GlobalKey<ScaffoldState>());
}

final naviagtionKeyProvider =
    StateNotifierProvider<NavigationKeyNotifier, GlobalKey<ScaffoldState>>(
        (ref) => NavigationKeyNotifier());
