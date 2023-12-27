import 'package:temporizador_/modals/user.dart';
import 'package:temporizador_/provider/countdown_provider.dart';

Map<int, User> dummyUsers = {
  1: User(
    id: 1,
    name: 'João',
    toy: 'Pula-Pula',
    countdownProvider: CountdownProvider(),
  ),
};
