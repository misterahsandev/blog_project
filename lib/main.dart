import 'dart:io';

import 'package:blogproject/splash_screen/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid ? FirebaseOptions(apiKey:"AIzaSyCqzXZ0K8F9POGMaKKvsY8E6TMVB7OdPyU",
          appId: "1:953751732724:android:5ff78e646ad48040ff39a1",
          messagingSenderId: "953751732724",
          projectId:"blogapp-472ec")
          :null
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: false,
      ),
      home:  Splash_screenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

