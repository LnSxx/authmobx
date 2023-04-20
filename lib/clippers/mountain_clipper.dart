import 'package:flutter/material.dart';

class ParabolicClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final bezierPointX = size.width * 0.75;
    path.moveTo(0, size.height);
    path.quadraticBezierTo(bezierPointX, 0, size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ParabolicClipper oldClipper) => false;
}
