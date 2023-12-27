import 'package:temporizador_/provider/countdown_provider.dart';

class User {
  int? id;
  String name;
  String toy;
  CountdownProvider countdownProvider;

  User({
    this.id,
    required this.name,
    required this.toy,
    required this.countdownProvider,
  });
}
