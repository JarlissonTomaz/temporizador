import 'package:flutter/material.dart';
import 'package:temporizador_/components/user_tile.dart';
import 'package:temporizador_/data/dummy_users.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key, required this.itemCount});
  final int itemCount;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var users = {...dummyUsers};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.itemCount, // Número de itens na lista
        itemBuilder: (context, i) => UserTile(users.values.elementAt(i)));
  }
}
