import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool canAuthenticate = false;
  bool didAuthenticate = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

  Future<void> _checkBiometricAvailability() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool canCheckBiometrics = await auth.canCheckBiometrics;
      final bool isDeviceSupported = await auth.isDeviceSupported();

      setState(() {
        canAuthenticate = canCheckBiometrics && isDeviceSupported;
      });

      if (!canAuthenticate) {
        print("Biometrics is not available on this device.");
      }
    } on PlatformException catch (e) {
      print("Error checking biometric availability: $e");
    }
  }

  Future<void> _authenticate() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();

      didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true,
            sensitiveTransaction: false),
      );

      setState(() {});

      if (didAuthenticate) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
          (route) => false,
        );
      }
    } on PlatformException catch (e) {
      print("Authentication error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          !canAuthenticate
              ? "Biometrics Not available"
              : didAuthenticate
                  ? "Authenticated"
                  : "Please unlock with biometrics",
        ),
      ),
      floatingActionButton: canAuthenticate
          ? FloatingActionButton(
              onPressed: _authenticate,
              tooltip: 'Authenticate',
              child: Icon(Icons.fingerprint),
            )
          : null,
    );
  }
}
