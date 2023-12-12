import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_/provider/users_state.dart';
import 'package:temporizador_/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Users(),
          ),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
