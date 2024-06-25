import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tintinapp/models/album.dart';


class AlbumService {
  static Future<List<Album>> fetchAlbums() async {
    String jsonString = await rootBundle.loadString('data/albums.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Album> albums = jsonList.map((json) => Album.fromJson(json)).toList();
    return albums;
  }
}
