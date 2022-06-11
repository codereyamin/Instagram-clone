import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout_screen.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/uitiles/colors.dart';

void main() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyAvCAGAnUWLPSSW32DYX8e5BWbzfRi-Jbs',
            appId: '1:677803753291:web:1dbfbc643dff75726eb2ce',
            messagingSenderId: '677803753291',
            projectId: 'instagram-clone-eacc9',
            storageBucket: 'instagram-clone-eacc9.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'clone instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileSearchColor,
      ),
      home: ResponsivLaout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
