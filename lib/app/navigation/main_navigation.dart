import 'package:bouncy_ball/app/screens/ball_screen/ball_screen.dart';
import 'package:bouncy_ball/app/screens/ball_screen/ball_screen_view_model.dart';
import 'package:bouncy_ball/app/screens/home_screen/home_screen.dart';
import 'package:bouncy_ball/app/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class RouteNames {
  static const home = '/';
  static const ballPage = '/bouncy_ball';
}

class MainNavigation {
  static Route onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case RouteNames.home:
        page = ChangeNotifierProvider(
          create: (context) => HomeScreenViewModel(context),
          child: const HomeScreen(),
        );
        break;
      case RouteNames.ballPage:
        final _arguments = settings.arguments as Map<String, dynamic>;
        page = ChangeNotifierProvider(
          create: (context) =>
              BallScreenViewModel(context, arguments: _arguments),
          child: const BallScreen(),
        );
        break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
