import 'package:flutter/material.dart';

class BallFieldBlueLine extends StatelessWidget {
  const BallFieldBlueLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      thickness: 2,
      color: Colors.blue,
    );
  }
}
