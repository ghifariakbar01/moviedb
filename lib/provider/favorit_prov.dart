import 'package:flutter/material.dart';
import 'package:omdb/model/mod_favorit.dart';

class FooModel extends ChangeNotifier {
  List<Favorit> _favorit = [];

  List<Favorit> get favorit => _favorit;

  void addFavorit(Favorit value) {
    _favorit.add(value);
    notifyListeners();
  }

  // get favoirt
  List<Favorit> getFavorit() {
    return _favorit;
  }

  void removeFavorit(Favorit value) {
    _favorit.remove(value);
    notifyListeners();
  }
}
