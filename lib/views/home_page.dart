import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_/components/list_view.dart';
import 'package:temporizador_/modals/user.dart';
import 'package:temporizador_/provider/users_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    var myItemCount = users.count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha lista de brinquedos',
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromRGBO(235, 238, 255, 1),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(235, 238, 255, 1),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
            top: 20,
            right: 10,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              hintText: 'Insira novo brinquedo',
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 10,
              ),
              child: Container(
                alignment: Alignment.center,
                width: 240,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    )),
                child: Text('Quantidade de Brinquedos : $myItemCount'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: GestureDetector(
                onTap: () {
                  users.put(User(
                    name: "name",
                    toy: "toy",
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(12, 125, 161, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Text('Adicionar',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: MyListView(
            itemCount: myItemCount,
          ),
        ))
      ]),
    );
  }
}
