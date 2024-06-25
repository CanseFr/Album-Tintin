import 'package:flutter/material.dart';
import 'package:tintinapp/models/album.dart';

class AlbumInfo extends StatelessWidget {
  final Album album;

  const AlbumInfo({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Album n°: ${album.number}', style: TextStyle(fontSize: 18, color: Colors.white)),
            Image.asset(
              album.image,
              width: 200,
              // height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.all(15), child:
            Text('Résumé : ${album.resume}', style: TextStyle(fontSize: 15, color: Colors.white)),
              )
            // Ajoutez d'autres informations sur l'album selon vos besoins
          ],
        ),
      ),
    );
  }
}
