import 'dart:math';

import 'package:flutter/material.dart';
import 'package:temporizador_/data/dummy_users.dart';
import 'package:temporizador_/modals/user.dart';
import 'package:temporizador_/provider/countdown_provider.dart';

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
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return;
    }
    if (user.id != null && _items.containsKey(user.id)) {
      _items.update(
        user.id!,
        (existingUser) {
          existingUser.name = user.name;
          existingUser.toy = user.toy;
          existingUser.countdownProvider
              .setCountdownDuration(existingUser.countdownProvider.duration);
          return existingUser;
        },
      );
    } else {
      final id = Random().nextInt(10000);
      final newUser = User(
        id: id,
        name: user.name,
        toy: user.toy,
        countdownProvider: CountdownProvider(),
      );

      print("New User Countdown ID: $id");

      _items.putIfAbsent(id, () => newUser);
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
