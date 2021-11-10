import 'package:flutter/material.dart';

class BallFieldSideCircle extends StatelessWidget {
  const BallFieldSideCircle({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width * .4,
      height: _width * .4,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.red,
          )),
    );
  }
}
