import 'package:bouncy_ball/app/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeInput extends StatelessWidget {
  const HomeInput({
    Key? key,
    required this.hintText,
    required this.changeSpeed,
    required this.validateSpeed,
    this.error,
  }) : super(key: key);

  final String hintText;
  final Function changeSpeed;
  final Function validateSpeed;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final _model = context.read<HomeScreenViewModel>();
    final _width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _width * .32,
      child: TextFormField(
        toolbarOptions: const ToolbarOptions(
          copy: false,
          cut: false,
          paste: false,
          selectAll: false,
        ),
        keyboardType: TextInputType.number,
        onSaved: (newValue) => changeSpeed(newValue),
        validator: (value) => validateSpeed(value),
        onChanged: (value) => validateSpeed(value),
        onFieldSubmitted: (value) => _model.onButtonPress,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        cursorColor: Colors.black,
        cursorRadius: const Radius.circular(50),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: error != null
                ? BorderSide(
                    width: 1,
                    color: Colors.red,
                  )
                : BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.black.withOpacity(.1),
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 10,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
