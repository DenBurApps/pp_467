import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'dart:math';

class CircularProgressPainter extends CustomPainter {
  final double progress; // Percentage progress (0.0 to 1.0)
  final double strokeWidth; // Width of the circular border
  final Color color; // Color of the border
  final Color backgroundColor; // Background color of the circle

  CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    // Draw the background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress circle
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final sweepAngle = 2 * pi * progress; // Progress in radians
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start at the top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}

class CircularProgressIndicatorWidget extends StatelessWidget {
  final double progress;
  final double borderWidth;
  final double size;
  final Widget? child;

  const CircularProgressIndicatorWidget({
    super.key,
    required this.progress,
    required this.size,
    this.borderWidth = 8.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: CircularProgressPainter(
            progress: progress,
            strokeWidth: borderWidth,
            color: context.colors.primary,
            backgroundColor: Colors.transparent,
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
