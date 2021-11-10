import 'package:bouncy_ball/app/constants.dart';
import 'package:bouncy_ball/app/screens/home_screen/components/speed_inputs.dart';
import 'package:bouncy_ball/app/screens/home_screen/components/start_button.dart';
import 'package:bouncy_ball/app/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<HomeScreenViewModel>();

    return GestureDetector(
      onTap: () => _model.removeFocus(context),
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          toolbarHeight: 60,
          elevation: 0,
          title: HomeScreenAppBarContent(),
          centerTitle: true,
        ),
        backgroundColor: kHomeBackgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SpeedInputs(),
              SizedBox(
                height: 40,
              ),
              StartButton(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenAppBarContent extends StatelessWidget {
  const HomeScreenAppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _xCoord =
        context.select((HomeScreenViewModel value) => value.state.xCoord);
    final _yCoord =
        context.select((HomeScreenViewModel value) => value.state.yCoord);

    return _xCoord != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTextSpan(
                coord: _xCoord,
                text: 'X: ',
              ),
              _buildTextSpan(
                coord: _yCoord,
                text: 'Y: ',
              ),
            ],
          )
        : Text('');
  }

  RichText _buildTextSpan({double? coord, String? text}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '$coord',
          ),
        ],
      ),
    );
  }
}
