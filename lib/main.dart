import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_/provider/countdown_provider.dart';
import 'package:temporizador_/provider/users_state.dart';
import 'package:temporizador_/routes/app_routes.dart';
import 'package:temporizador_/views/countdown.dart';
import 'package:temporizador_/views/home_page.dart';

CountdownProvider createCountdownProvider() => CountdownProvider();
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
        ChangeNotifierProvider(
          create: (context) => createCountdownProvider(),
        )
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.userHome: (_) => const HomePage(),
          AppRoutes.userCountdown: (_) => const AppCountdown(),
        },
      ),
    );
  }
}
