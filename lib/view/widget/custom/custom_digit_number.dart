import 'dart:math';

import 'package:flutter/material.dart';

import '../../../res/colors.dart';

class CustomDigitNumber extends StatelessWidget {
  final int? number;

  const CustomDigitNumber({super.key, this.number});

  static const Map<int, List<bool>> segments = {
    0: [true, true, true, true, true, true, false],
    1: [false, true, true, false, false, false, false],
    2: [true, true, false, true, true, false, true],
    3: [true, true, true, true, false, false, true],
    4: [false, true, true, false, false, true, true],
    5: [true, false, true, true, false, true, true],
    6: [true, false, true, true, true, true, true],
    7: [true, true, true, false, false, false, false],
    8: [true, true, true, true, true, true, true],
    9: [true, true, true, true, false, true, true],
  };

  @override
  Widget build(BuildContext context) {
    final segment = (number != null && segments.containsKey(number))
        ? segments[number]!
        : List.filled(7, false);
    return SizedBox(
      height: 96,
      width: 52,
      child: Stack(
        children: [
          //0
          Positioned(
            left: 2,
            top: 0,
            child: CustomPaint(
              size: Size(48, 8),
              painter: TrapezoidPainter(
                angleDegrees: 180,
                isShow: segment[0]
              ),
            ),
          ),
          //1
          Positioned(
            right: -19,
            top: 20.5,
            child: CustomPaint(
              size: Size(46, 8),
              painter: TrapezoidPainter(
                angleDegrees: -90,
                isShow: segment[1]
              ),
            ),
          ),
          //2
          Positioned(
            right: -19,
            bottom: 20.5,
            child: CustomPaint(
              size: Size(46, 8),
              painter: TrapezoidPainter(
                angleDegrees: -90,
                isShow: segment[2]
              ),
            ),
          ),
          //3
          Positioned(
            left: 2,
            bottom: 0,
            child: CustomPaint(
              size: Size(48, 8),
              painter: TrapezoidPainter(
                angleDegrees: 0,
                isShow: segment[3]
              ),
            ),
          ),
          //4
          Positioned(
            left: -19,
            bottom: 20.5,
            child: CustomPaint(
              size: Size(46, 8),
              painter: TrapezoidPainter(
                angleDegrees: 90,
                isShow: segment[4]
              ),
            ),
          ),
          //5
          Positioned(
            left: -19,
            top: 20.5,
            child: CustomPaint(
              size: Size(46, 8),
              painter: TrapezoidPainter(
                angleDegrees: 90,
                isShow: segment[5]
              ),
            ),
          ),
          //6
          Positioned(
            left: 2,
            bottom: 44,
            child: CustomPaint(
              size: Size(48, 8),
              painter: HexagonHorizontalPainter(
                isShow: segment[6]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  final double angleDegrees;
  final bool isShow;

  TrapezoidPainter({this.angleDegrees = 0, this.isShow = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isShow ? AppColors.black : AppColors.ffe6e6e6
      ..style = PaintingStyle.fill;

    final path = Path();

    final radians = angleDegrees * pi / 180;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(radians);
    canvas.translate(-center.dx, -center.dy);

    path.moveTo(size.width * 1 / 6, 0);
    path.lineTo(size.width * 5 / 6, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant TrapezoidPainter oldDelegate) {
    return oldDelegate.angleDegrees != angleDegrees ||
        oldDelegate.isShow != isShow;
  }
}

class HexagonHorizontalPainter extends CustomPainter {
  final bool isShow;

  HexagonHorizontalPainter({this.isShow = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isShow ? AppColors.black : AppColors.ffe6e6e6
      ..style = PaintingStyle.fill;

    final path = Path();

    final w = size.width;
    final h = size.height;

    final p1 = Offset(w * 0.125, 0);
    final p2 = Offset(w * 0.875, 0);
    final p3 = Offset(w, h / 2);
    final p4 = Offset(w * 0.875, h);
    final p5 = Offset(w * 0.125, h);
    final p6 = Offset(0, h / 2);

    path.moveTo(p1.dx, p1.dy);
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p3.dx, p3.dy);
    path.lineTo(p4.dx, p4.dy);
    path.lineTo(p5.dx, p5.dy);
    path.lineTo(p6.dx, p6.dy);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant HexagonHorizontalPainter oldDelegate) {
    return oldDelegate.isShow != isShow;
  }
}
