import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_/components/user_tile.dart';
import 'package:temporizador_/provider/users_state.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key, required this.itemCount});
  final int itemCount;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return ListView.builder(
        itemCount: widget.itemCount, // Número de itens na lista
        itemBuilder: (context, i) => UserTile(users.byIndex(i)));
  }
}
