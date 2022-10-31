import 'package:flutter/material.dart';

class HomePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Color.fromARGB(255, 18, 83, 135);

    var path = Path();

    path.moveTo(0, 250);
    path.quadraticBezierTo(40, 310, 120, 250);
    path.quadraticBezierTo(210, 190, 240, 320);
    path.quadraticBezierTo(300, 520, size.width, 440);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ActivityCardPaint extends CustomPainter {
  final Color paintColor;
  ActivityCardPaint(this.paintColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = paintColor.withOpacity(.15);
    var paint2 = Paint()..color = paintColor.withOpacity(.1);

    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.04, size.height);

    path.quadraticBezierTo(40, 125, 80, 130);
    path.quadraticBezierTo(120, 140, 135, 130);
    path.quadraticBezierTo(150, 120, 150, 100);

    path.lineTo(size.width, 100);

    canvas.drawPath(path, paint);

    var path2 = Path();
    path2.moveTo(size.width, size.height);
    path2.lineTo(size.width * 0.04, size.height);

    path2.quadraticBezierTo(-18, 110, 45, 135);
    path2.quadraticBezierTo(80, 150, 110, 130);
    path2.quadraticBezierTo(140, 110, 150, 75);

    path2.lineTo(size.width, 100);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ChatPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromARGB(255, 18, 83, 135);
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.01, size.height * 0.5,
        size.width * 0.08, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.99, size.height * 0.45, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
