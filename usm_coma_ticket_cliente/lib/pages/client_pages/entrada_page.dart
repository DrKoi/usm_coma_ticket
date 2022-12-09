import 'package:flutter/material.dart';

class EntradasPage extends StatefulWidget {
  const EntradasPage({super.key});

  @override
  State<EntradasPage> createState() => _EntradasPageState();
}

class _EntradasPageState extends State<EntradasPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Entradas'),
    );
  }
}
