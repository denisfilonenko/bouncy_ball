import 'package:bouncy_ball/app/screens/home_screen/components/home_input.dart';
import 'package:bouncy_ball/app/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpeedInputs extends StatelessWidget {
  const SpeedInputs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<HomeScreenViewModel>();
    final _width = MediaQuery.of(context).size.width;
    final _xError =
        context.select((HomeScreenViewModel value) => value.state.xError);
    final _yError =
        context.select((HomeScreenViewModel value) => value.state.yError);

    return Form(
      key: _model.state.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * .1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeInput(
              hintText: 'X-speed',
              changeSpeed: _model.changeHorizontalSpeed,
              validateSpeed: _model.validateXSpeed,
              error: _xError,
            ),
            HomeInput(
              hintText: 'Y-speed',
              changeSpeed: _model.changeVerticalSpeed,
              validateSpeed: _model.validateYSpeed,
              error: _yError,
            ),
          ],
        ),
      ),
    );
  }
}
