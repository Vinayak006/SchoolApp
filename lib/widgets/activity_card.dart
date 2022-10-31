import 'package:flutter/material.dart';
import '../custom_painter.dart';

class Activity extends StatelessWidget {
  final String activity;
  final String progress;
  final IconData icon;
  final Color color;
  final Color paint;
  const Activity({
    Key? key,
    required this.activity,
    required this.progress,
    required this.icon,
    required this.color,
    required this.paint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.44,
      height: height * 0.17,
      child: Card(
        elevation: 4,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        activity,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 18, 83, 135),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        icon,
                        size: width * 0.1,
                        color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.6),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    progress,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 18, 83, 135),
                    ),
                  )
                ],
              ),
            ),
            CustomPaint(
              painter: ActivityCardPaint(paint),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

