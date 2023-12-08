import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount, // Número de itens na lista
      itemBuilder: (BuildContext context, int index) {
        // Verifica se o índice é par ou ímpar para decidir como dividir a linha
        if (index.isEven) {
          return MyRowItem(index);
        }
        return const Divider(); // Adiciona um divisor nos índices ímpares
      },
    );
  }
}

class MyRowItem extends StatelessWidget {
  final int index;

  const MyRowItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: 190,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(-1, 3),
                  )
                ]),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PULA-PULA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          'João',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 190,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(-1, 3),
                )
              ]),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PULA-PULA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        'João',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
