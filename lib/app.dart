import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_book/features/organizations/presentation/organizations_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return const MaterialApp(
      title: 'Справочник',
      home: OrganizationScreen(),
    );
  }
}
