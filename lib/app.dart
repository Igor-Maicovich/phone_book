import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_book/presentation/main_screen/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return MaterialApp(
      home: Mainscreen(),
    );
  }
}
