import 'package:bouncy_ball/app/constants.dart';
import 'package:bouncy_ball/app/screens/ball_screen/ball_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ball extends StatelessWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.watch<BallScreenViewModel>();

    return Positioned(
      left: _model.state.xAlignment,
      top: _model.state.yAlignment,
      child: Container(
        width: _model.state.ballSize,
        height: _model.state.ballSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBallColor,
        ),
      ),
    );
  }
}
