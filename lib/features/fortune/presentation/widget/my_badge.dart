import 'package:flutter/cupertino.dart';
import 'package:starlog_mobile/core/constants/color.dart';

class MyBadgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final r = 14.0;
    final tailHeight = 10.0;
    final tailWidth = 9.5;
    final bodyHeight = size.height - tailHeight;

    final fillPaint = Paint()
      ..color = BadgeColor.fill
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = BadgeColor.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path()
    ..moveTo(r, 0)
    ..lineTo(size.width - r, 0)
    ..arcToPoint(Offset(size.width, r), radius: Radius.circular(r))
    ..lineTo(size.width, bodyHeight - r)
    ..arcToPoint(Offset(size.width - r, bodyHeight), radius: Radius.circular(r))
    ..lineTo(size.width / 2 + tailWidth / 2, bodyHeight)
    ..lineTo(size.width / 2, size.height)
    ..lineTo(size.width / 2 - tailWidth / 2, bodyHeight)
    ..lineTo(r, bodyHeight)
    ..arcToPoint(Offset(0, bodyHeight - r), radius: Radius.circular(r))
    ..lineTo(0, r)
    ..arcToPoint(Offset(r, 0), radius: Radius.circular(r))
    ..close();

    canvas.drawShadow(path, StarlogColor.black.withValues(alpha: 0.2), 4, false);
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter _) => false;
}
