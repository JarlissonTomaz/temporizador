import 'package:flutter/material.dart';
import 'package:temporizador_/components/timer_tile.dart';
import 'package:temporizador_/modals/user.dart';
import 'package:temporizador_/provider/countdown_provider.dart';
import 'package:temporizador_/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  const UserTile(this.user, {super.key});
  final User user;
  @override
  Widget build(BuildContext context) {
// ...

// Use o valor de timeIsUp

    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListTile(
          title: Text(user.toy),
          subtitle: Text(user.name),
          trailing: const CountDowm(),
          tileColor: Colors.white,
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.userCountdown,
              arguments: {
                user,
                CountdownProvider(),
              },
            );
          },
        ));
  }
}
