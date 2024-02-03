// All Core global plugins
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Functions and utility logics
import 'utilities/theme/theme_provider.dart';
import 'layouts/splash.dart';

bool? isFirstTimeView;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
      home: const Splash(),
    );
  }
}


