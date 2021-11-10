import 'package:bouncy_ball/app/navigation/main_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _HomeScreenState {
  double xSpeed = 0;
  double ySpeed = 0;
  bool buttonIsLoading = false;
  double? xCoord;
  double? yCoord;
  String? xError;
  String? yError;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  late BuildContext context;

  _HomeScreenState();
}

class HomeScreenViewModel extends ChangeNotifier {
  final _state = _HomeScreenState();

  _HomeScreenState get state => _state;

  HomeScreenViewModel(BuildContext context, {Map<String, dynamic>? arguments}) {
    print('arguments: $arguments');
    _state.context = context;
  }

  void _changeButtonLoading(bool value) {
    if (_state.buttonIsLoading == value) return;
    _state.buttonIsLoading = value;
    notifyListeners();
  }

  void removeFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void changeHorizontalSpeed(String value) {
    if (_state.xSpeed == value) return;
    _state.xSpeed = (int.parse(value) / 100).toDouble();
    notifyListeners();
  }

  void changeVerticalSpeed(String value) {
    if (_state.ySpeed == value) return;
    _state.ySpeed = (int.parse(value) / 100).toDouble();
    notifyListeners();
  }

  dynamic _goToBallPage() async {
    final result = await Navigator.of(_state.context).pushNamed(
            RouteNames.ballPage,
            arguments: {'xSpeed': _state.xSpeed, 'ySpeed': _state.ySpeed})
        as Map<String, dynamic>;

    _state.xCoord = double.parse((result['xCoord']).toStringAsFixed(2));
    _state.yCoord = double.parse((result['yCoord']).toStringAsFixed(2));
    notifyListeners();
  }

  void _saveSpeed() {
    _state.formKey.currentState!.save();
  }

  dynamic validateXSpeed(String value) {
    if (value.isEmpty) {
      _state.xError = 'Empty field';
    } else if (int.tryParse(value) == null) {
      _state.xError = 'Invalid value';
    } else {
      _state.xError = null;
    }
    notifyListeners();
    return null;
  }

  dynamic validateYSpeed(String value) {
    if (value.isEmpty) {
      _state.yError = 'Empty field';
    } else if (int.tryParse(value) == null) {
      _state.yError = 'Invalid value';
    } else {
      _state.yError = null;
    }
    notifyListeners();
    return null;
  }

  void onButtonPress() {
    _changeButtonLoading(true);
    _state.formKey.currentState!.validate();
    if (_state.xError == null && _state.yError == null) {
      _saveSpeed();
      _goToBallPage();
      removeFocus(_state.context);
    }
    _changeButtonLoading(false);
  }
}
