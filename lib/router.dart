import 'package:go_router/go_router.dart';

import 'main_menu/main_menu_screen.dart';
import 'main_menu/login_page.dart';
import 'play_session/game_widget.dart'; 
import 'settings/settings_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/main_menu',
          builder: (context, state) {
            final String? name = state.uri.queryParameters['name'];
            return MainMenuScreen(name: name);
      },
      routes: [
        GoRoute(
          path: 'play',
           builder: (context, state) {
           return GameWidget();
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
