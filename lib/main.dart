import 'package:flutter/material.dart';
import 'package:splash_onboarding/splashScreen.dart';
import 'cacheHelper.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}