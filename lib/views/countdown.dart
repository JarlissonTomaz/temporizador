import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_/provider/countdown_provider.dart';
import 'package:temporizador_/provider/users_state.dart';

class AppCountdown extends StatefulWidget {
  const AppCountdown({super.key});

  @override
  State<AppCountdown> createState() => _AppCountdownState();
}

class _AppCountdownState extends State<AppCountdown> {
  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountdownProvider>(context);
    final users = Provider.of<Users>(context);

    print('No AppCountdown: ${countdownProvider.hashCode}');
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Editar nome/Brinquedo',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 182, 198, 1),
                          )),
                      onTap: () {
                        _showBottomSheet(context);
                      },
                    ),
                    const PopupMenuItem(
                      child: Text('Editar Tempo',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 182, 198, 1),
                          )),
                    ),
                  ])
        ],
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromRGBO(130, 182, 198, 1),
      ),
      backgroundColor: const Color.fromRGBO(130, 182, 198, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Text(
                context.select(
                    (CountdownProvider countdown) => countdown.timeLeftString),
                style: const TextStyle(
                  fontSize: 75.0,
                  color: Color.fromRGBO(32, 133, 165, 1),
                  fontWeight: FontWeight.w900,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {
                    countdownProvider
                        .setCountdownDuration(const Duration(seconds: 75));
                  },
                  icon: const Icon(
                    Icons.autorenew,
                    size: 40,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Color.fromARGB(75, 0, 0, 0),
                        offset: Offset(0, 2),
                        blurRadius: 20,
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  right: 60,
                  top: 10,
                  left: 60,
                ),
                child: GestureDetector(
                  onTap: () {
                    countdownProvider.startStopTimer();
                  },
                  child: Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(12, 125, 160, 0.2),
                      ),
                      child: Icon(
                        countdownProvider.isRunning
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
              ),
              IconButton(
                onPressed: () {
                  users.remove(users.byIndex(0));
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadows: [
                    BoxShadow(
                      color: Color.fromARGB(75, 0, 0, 0),
                      offset: Offset(0, 2),
                      blurRadius: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Conteúdo da folha modal

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    top: 10.0,
                    bottom: 50,
                  ),
                  child: Text(
                    'Editar Nome/Brinquedo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 90.0,
                    bottom: 50,
                  ),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey,
                      )),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                bottom: 50.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Editar "),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(12, 125, 161, 1),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: const Text('Editar',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
