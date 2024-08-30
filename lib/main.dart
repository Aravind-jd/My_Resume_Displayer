import 'package:flutter/material.dart';

import 'package:my_resume/pages/mainpage.dart';
import 'package:my_resume/pages/splashpage.dart';

void main() {
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: 'splash_page',
    routes: {
      'splash_page':(context) => const Splashpage(),
      'main_page':(context) => const Mainpage(),
    },
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}