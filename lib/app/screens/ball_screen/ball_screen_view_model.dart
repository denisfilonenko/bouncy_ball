import 'dart:async';

import 'package:flutter/material.dart';

enum direction { Up, Down, Left, Right }

class _BallScreenState {
  double ballSize = 30;
  late double xSpeed;
  late double ySpeed;
  late Timer timer;
  late BuildContext context;
  double xAlignment = 150;
  double yAlignment = 150;
  var xBallDirection = direction.Right;
  var yBallDirection = direction.Down;

  _BallScreenState();
}

class BallScreenViewModel extends ChangeNotifier {
  final _state = _BallScreenState();

  _BallScreenState get state => _state;

  final dynamic arguments;

  BallScreenViewModel(BuildContext context, {required this.arguments}) {
    _state.context = context;
    _state.xSpeed = arguments['xSpeed'];
    _state.ySpeed = arguments['ySpeed'];

    _startBouncing();
  }

  void onBackButtonPressed() {
    final popArguments = {
      'xCoord': _state.xAlignment,
      'yCoord': _state.yAlignment
    };
    Navigator.pop(_state.context, popArguments);
  }

  Future<bool> onWillPop() async {
    onBackButtonPressed();
    return true;
  }

  void _startBouncing() {
    _state.timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      _changeDirection();
      _moveBall();
    });
  }

  void _changeDirection() {
    final maxWidth = MediaQuery.of(_state.context).size.width;
    final maxHeight = MediaQuery.of(_state.context).size.height -
        MediaQuery.of(_state.context).padding.top -
        AppBar().preferredSize.height;

    if (_state.ySpeed < 0) {
      _state.yBallDirection = direction.Up;
      _state.ySpeed = -_state.ySpeed;
    }

    if (_state.xSpeed < 0) {
      _state.xBallDirection = direction.Left;
      _state.xSpeed = -_state.xSpeed;
    }

    if (_state.yAlignment >= maxHeight - _state.ballSize) {
      _state.yBallDirection = direction.Up;
    } else if (_state.yAlignment <= 0) {
      _state.yBallDirection = direction.Down;
    }

    if (_state.xAlignment >= maxWidth - _state.ballSize) {
      _state.xBallDirection = direction.Left;
    } else if (_state.xAlignment <= 0) {
      _state.xBallDirection = direction.Right;
    }

    notifyListeners();
  }

  void _moveBall() {
    if (_state.yBallDirection == direction.Down) {
      _state.yAlignment += _state.ySpeed;
    } else if (_state.yBallDirection == direction.Up) {
      _state.yAlignment -= _state.ySpeed;
    }

    if (_state.xBallDirection == direction.Left) {
      _state.xAlignment -= _state.xSpeed;
    } else if (_state.xBallDirection == direction.Right) {
      _state.xAlignment += _state.xSpeed;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _state.timer.cancel();
    super.dispose();
  }
}
