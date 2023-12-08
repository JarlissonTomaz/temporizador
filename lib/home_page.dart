import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha lista de brinquedos',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
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
              padding: const EdgeInsets.all(10.0),
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
                child: const Text('Quantidade de Brinquedos : 0'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 140,
              height: 30,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(12, 125, 161, 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: const Text('Adicionar',
                  style: TextStyle(color: Colors.white)),
            )
          ],
        )
      ]),
    );
  }
}
