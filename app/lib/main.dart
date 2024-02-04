// All Core global plugins
import 'package:app/layouts/OBScreen.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Functions and utility logics
import 'utilities/theme/theme_provider.dart';
import 'layouts/splash.dart';

bool? isFirstTimeView;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isFirstTimeView = preferences.getBool('isFirstTimeView') ?? true;

  runApp(
    // Extending the Application State to ProviderScope of RiverPod
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget with CustomThemeDataMixin {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(themeProvider).keys.first;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: isFirstTimeView == true ? const OBScreen() : const Splash(),
    );
  }
}
