import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Favoritemodel extends ChangeNotifier{
  final List<int> _items = [];

  List<int> get items => List.unmodifiable(_items);

  void add(int indexAlbumFav) {
    _items.add(indexAlbumFav);
    notifyListeners();
  }

  bool contain(int value){
    return _items.contains(value);
  }

  void remove(int indexAlbumFav) {
    _items.remove(indexAlbumFav);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}