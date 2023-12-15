import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_/provider/users_state.dart';
import 'package:temporizador_/routes/app_routes.dart';
import 'package:temporizador_/views/home_page.dart';
import 'package:temporizador_/views/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.userHome: (_) => const HomePage(),
          AppRoutes.userTimer: (_) => const UserTimer(),
        },
      ),
    );
  }
}
