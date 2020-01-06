import 'package:flutter/material.dart';
import 'package:honor_store/screens/home_screen.dart';
import 'package:honor_store/screens/login_screen.dart';
import 'package:honor_store/screens/main_screen.dart';
import 'package:honor_store/services/firebase_authentication_service.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthenticationService>(context, listen: false);

    return StreamBuilder(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return MainScreen();
          }
          return LoginScreen();
        }
        return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
