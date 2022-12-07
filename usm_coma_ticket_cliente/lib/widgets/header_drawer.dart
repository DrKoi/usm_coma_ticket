import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderDelDrawer extends StatelessWidget {
  final String backgroudImage;
  final String nombreUsuario;
  final String email;

  const HeaderDelDrawer(
      {super.key,
      required this.backgroudImage,
      required this.nombreUsuario,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(backgroudImage),
          ),
          SizedBox(
            height: 12,
          ),
          Text(nombreUsuario),
          SizedBox(
            height: 8,
          ),
          Text(email),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
