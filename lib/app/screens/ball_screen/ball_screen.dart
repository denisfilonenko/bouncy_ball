import 'package:bouncy_ball/app/constants.dart';
import 'package:bouncy_ball/app/screens/ball_screen/ball_screen_view_model.dart';
import 'package:bouncy_ball/app/screens/ball_screen/components/ball.dart';
import 'package:bouncy_ball/app/screens/ball_screen/components/ball_field_blue_line.dart';
import 'package:bouncy_ball/app/screens/ball_screen/components/ball_field_main_circle.dart';
import 'package:bouncy_ball/app/screens/ball_screen/components/ball_field_main_line.dart';
import 'package:bouncy_ball/app/screens/ball_screen/components/ball_field_side_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BallScreen extends StatelessWidget {
  const BallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<BallScreenViewModel>();
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;
    ;

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
                Positioned(
                  top: -_height * .18,
                  left: (_width / 2) - _width * .2,
                  child: BallFieldSideCircle(width: _width),
                ),
                Positioned(
                  bottom: -_height * .18,
                  left: (_width / 2) - _width * .2,
                  child: BallFieldSideCircle(width: _width),
                ),
                Positioned(
                  top: _height * .2,
                  left: 0,
                  right: 0,
                  child: BallFieldBlueLine(),
                ),
                Positioned(
                  bottom: _height * .2,
                  left: 0,
                  right: 0,
                  child: BallFieldBlueLine(),
                ),
                Positioned(
                  top: _height * .5 - 6,
                  left: 0,
                  right: 0,
                  child: BallFieldMainLine(),
                ),
                Positioned(
                  top: _height * .5 - 96,
                  left: (_width / 2) - 96,
                  child: BallFieldMainCircle(width: _width),
                ),
                Ball(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
