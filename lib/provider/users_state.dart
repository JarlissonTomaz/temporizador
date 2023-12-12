import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:temporizador_/data/dummy_users.dart';
import 'package:temporizador_/modals/user.dart';

class Users with ChangeNotifier {
  final Map<int, User> _items = {...dummyUsers};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }
    if (user.id != null && _items.containsKey(user.id)) {
      _items.update(
          user.id!,
          (_) => User(
                id: user.id,
                name: user.name,
                toy: user.toy,
              ));
    } else {
      final id = Random().nextInt(10000);
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                toy: user.toy,
              ));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
