import 'package:bouncy_ball/app/constants.dart';
import 'package:flutter/material.dart';

class BallFieldMainCircle extends StatelessWidget {
  const BallFieldMainCircle({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBallFieldBackgroundColor,
          border: Border.all(
            width: 3,
            color: Colors.red,
          )),
    );
  }
}
