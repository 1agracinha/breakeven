import 'package:breakeven/screens/splash.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: primaryColor,
        textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
      ),
      home: Splash(),
    );
  }
}
