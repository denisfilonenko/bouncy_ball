import 'package:bouncy_ball/app/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _model = context.read<HomeScreenViewModel>();
    final _isLoading = context
        .select((HomeScreenViewModel value) => value.state.buttonIsLoading);

    return SizedBox(
      width: _width * .8,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: _isLoading ? () {} : _model.onButtonPress,
        child: _isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3.0,
                ),
              )
            : Text(
                'Start',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
