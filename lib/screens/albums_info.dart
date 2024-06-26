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

            Image.asset(
              album.image,
              width: 300,
              // height: 200,
              fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.all(20), child:
            Text('${album.title}', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600 )),
              ),

            Text('Album n°: ${album.number}', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.all(15), child:
            Text('Résumé :', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600))),
            Padding(padding: EdgeInsets.all(20), child:
            Text('${album.resume}', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center,))
            // Ajoutez d'autres informations sur l'album selon vos besoins
          ],
        ),
      ),
    );
  }
}
