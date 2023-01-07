import 'package:flutter/material.dart';
import 'package:oranos/constance/values.dart';
import 'package:oranos/presentation/screens/chat_screen/chat_screen.dart';
import 'package:oranos/presentation/screens/get_start_screen/get_start_screen.dart';
import 'package:oranos/presentation/screens/main_screen.dart';
import 'package:oranos/presentation/screens/start_screen/start_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case startScreen:
        return MaterialPageRoute(
          builder: (_) => const StartScreen(),
        );
      case getStartScreen:
        return MaterialPageRoute(
          builder: (_) => const GetStartScreen(),
        );
      case chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );
    }
    return null;
  }
}
