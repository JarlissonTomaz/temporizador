import 'package:flutter/material.dart';
import 'package:temporizador_/list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var myItemCount = 7;

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
                  left: 10, top: 10, right: 10, bottom: 30),
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
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 30,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(12, 125, 161, 1),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: const Text('Adicionar',
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
        Expanded(
            child: MyListView(
          itemCount: myItemCount,
        ))
      ]),
    );
  }
}
