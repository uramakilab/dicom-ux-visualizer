import 'package:flutter/material.dart';

import '../screens/choose_file.dart';
import '../screens/choose_from_storage.dart';
import '../screens/draw_page.dart';
import '../screens/main_menu.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainMenu());
      case '/draw':
        return MaterialPageRoute(builder: (_) => Draw());
      case '/files':
        return MaterialPageRoute(builder: (_) => ChooseFromStorage());
      default:
        return null;
    }
  }
}
