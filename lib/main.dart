import 'package:flutter/material.dart';
import 'package:honor_store/screens/auth_screen.dart';
import 'package:honor_store/services/firebase_authentication_service.dart';
import 'package:honor_store/services/firestore_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthenticationService>(
          create: (_) => FirebaseAuthenticationService(),
        ),
        Provider<FirestoreService>(
          create: (_) => FirestoreService(),
        ),
      ],
      child: MaterialApp(
        home: AuthWidget(),
      ),
    );
  }
}
