import 'package:flutter/material.dart';

class NoticiaWidget extends StatelessWidget {
  final String image;
  //final String? text;
  NoticiaWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
    );
  }
}
