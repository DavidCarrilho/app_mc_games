import 'package:app_mc_games/model/custom_stroke.dart';
import 'package:flutter/material.dart';

class PainterWidget extends CustomPainter {
  final List<CustomStroke>? strokes;
  final Color? color;
  final double? strokeWidth;

  PainterWidget({
    this.strokes,
    this.color,
    this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < strokes!.length - 1; i++) {
      final CustomStroke from = strokes![i];
      final CustomStroke to = strokes![i + 1];

      final Paint paint = Paint()
        ..color = from.color!
        ..strokeWidth = from.strokeWidth!
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(from.offset!, to.offset!, paint);
    }
  }

  @override
  bool shouldRepaint(PainterWidget oldDelegate) => strokes != oldDelegate.strokes;
}
