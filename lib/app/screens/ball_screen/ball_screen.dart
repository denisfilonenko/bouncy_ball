import 'package:bouncy_ball/app/constants.dart';
import 'package:bouncy_ball/app/screens/ball_screen/ball_screen_view_model.dart';
import 'package:bouncy_ball/app/screens/ball_screen/components/ball.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BallScreen extends StatelessWidget {
  const BallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<BallScreenViewModel>();

    return WillPopScope(
      onWillPop: _model.onWillPop,
      child: Scaffold(
        backgroundColor: kBallFieldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            onPressed: _model.onBackButtonPressed,
            icon: Icon(
              Icons.arrow_back,
              color: kBallFieldBackgroundColor,
            ),
            splashRadius: 20,
          ),
          backgroundColor: Colors.black,
          brightness: Brightness.dark,
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: Stack(
              children: [
                Ball(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
