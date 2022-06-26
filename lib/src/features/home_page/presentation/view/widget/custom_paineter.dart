import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class BackgroundCP extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.01000000,0), Offset(0,size.height*0.01000000), [Color(0xff053d75).withOpacity(0.7),Color(0xff0098b1).withOpacity(1)], [0,1]);
    canvas.drawRect(Rect.fromLTWH(0,0,size.width,size.height),paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}