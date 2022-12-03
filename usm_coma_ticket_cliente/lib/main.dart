import 'package:flutter/material.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';
import 'package:usm_coma_ticket_cliente/pages/login_page.dart';

import 'material_color_generator.dart';

final ThemeData theme = ThemeData(
  primarySwatch: generateMaterialColor(Palette.primary),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  //scaffoldBackgroundColor: Color(0xff1D7874),
);

class Palette {
  static const Color primary = kPrimaryColor;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: LoginPage(),
    );
  }
}
