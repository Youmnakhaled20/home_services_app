import 'package:flutter/material.dart';
import 'dart:math';

class AnalogClockPainter extends CustomPainter {
  final int hour;
  final int minute;
  final bool isDark;
  final Color neonColor;
  final Color darkBorderColor;

  const AnalogClockPainter({
    required this.hour,
    required this.minute,
    required this.isDark,
    required this.neonColor,
    required this.darkBorderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    final bgPaint = Paint()
      ..color = isDark ? const Color(0xFF1A1A1A) : Colors.grey[100]!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, bgPaint);
    final borderPaint = Paint()
      ..color = isDark ? darkBorderColor : Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius, borderPaint);
    for (int i = 0; i < 12; i++) {
      double angle = i * (2 * pi / 12) - pi / 2;
      double startRadius = radius - 12;
      double endRadius = radius - 22;

      Offset start = Offset(
        center.dx + startRadius * cos(angle),
        center.dy + startRadius * sin(angle),
      );
      Offset end = Offset(
        center.dx + endRadius * cos(angle),
        center.dy + endRadius * sin(angle),
      );

      final linePaint = Paint()
        ..color = isDark ? Colors.white : Colors.black
        ..strokeWidth = 3;

      canvas.drawLine(start, end, linePaint);
    }
    for (int i = 0; i < 60; i++) {
      if (i % 5 == 0) continue;
      double angle = i * (2 * pi / 60) - pi / 2;
      double startRadius = radius - 10;
      double endRadius = radius - 16;

      Offset start = Offset(
        center.dx + startRadius * cos(angle),
        center.dy + startRadius * sin(angle),
      );
      Offset end = Offset(
        center.dx + endRadius * cos(angle),
        center.dy + endRadius * sin(angle),
      );

      final linePaint = Paint()
        ..color = isDark ? Colors.grey[600]! : Colors.grey[400]!
        ..strokeWidth = 1.5;

      canvas.drawLine(start, end, linePaint);
    }
    for (int i = 1; i <= 12; i++) {
      double angle = i * (2 * pi / 12) - pi / 2;
      double textRadius = radius - 32;
      Offset textPos = Offset(
        center.dx + textRadius * cos(angle),
        center.dy + textRadius * sin(angle),
      );

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: i.toString(),
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, textPos - Offset(textPainter.width / 2, textPainter.height / 2));
    }

    // عقرب الساعات
    double hourAngle = ((hour % 12) + minute / 60) * (2 * pi / 12) - pi / 2;
    _drawHand(canvas, center, radius * 0.5, hourAngle, 8, isDark ? Colors.white : Colors.black, 6);

    // عقرب الدقائق
    double minuteAngle = minute * (2 * pi / 60) - pi / 2;
    _drawHand(canvas, center, radius * 0.7, minuteAngle, 6, isDark ? neonColor : const Color(0xFF235347), 5);

    // النقطة المركزية
    final centerPaint = Paint()
      ..color = isDark ? neonColor : const Color(0xFF235347)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 10, centerPaint);

    final innerPaint = Paint()
      ..color = isDark ? Colors.black : Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 4, innerPaint);
  }

  void _drawHand(Canvas canvas, Offset center, double length, double angle, double width, Color color, double tipSize) {
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, width + 4, shadowPaint);

    final handPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(center.dx - width / 2, center.dy - width / 2);
    path.lineTo(center.dx + length * cos(angle), center.dy + length * sin(angle));
    path.lineTo(center.dx + width / 2, center.dy + width / 2);
    path.close();

    canvas.drawPath(path, handPaint);

    final tipPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Offset tipPos = Offset(
      center.dx + length * cos(angle),
      center.dy + length * sin(angle),
    );
    canvas.drawCircle(tipPos, tipSize, tipPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}