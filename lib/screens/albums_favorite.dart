import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';
import '../providers/favorite_model.dart';
import '../services/album_service.dart';
import 'albums_info.dart';

class AlbumsFavorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var favoritemodel = Provider.of<Favoritemodel>(context);


    return Consumer<Favoritemodel>(
        builder: (context, listFavObs, child) {
          return Scaffold(

            appBar: AppBar(
              title: const Text('Favorites'),

            ),
            body: FutureBuilder<List<Album>>(

              future: AlbumService.fetchAlbums(),
              builder: (context, AsyncSnapshot<List<Album>> snapshot) {

                // VERIF REQUEST
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Aucun album disponible'));
                } else {
                  List<Album> favoriteAlbums = snapshot.data!.where((album) => favoritemodel.contain(album.number)).toList();

                  if (favoriteAlbums.isEmpty) {
                    return Center(child: Text('Aucun album favori'));
                  }


                  return ListView.builder(

                    itemCount: favoriteAlbums.length,
                    itemBuilder: (context, index) {

                      var album = favoriteAlbums[index];

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(

                            decoration: BoxDecoration(
                              color: Color.fromARGB(173, 44, 43, 43),
                              borderRadius: BorderRadius.circular(8.0),
                            ),



                            child: ListTile(
                              title: Text(album.title, style: TextStyle(color: Colors.white)),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    album.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),


                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [


                                  IconButton(
                                    icon: Icon(Icons.search, color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AlbumInfo(album: album),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),



                          ),

                        ),
                      );
                    },
                  );




                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Provider.of<Favoritemodel>(context, listen: false).removeAll();
              },
              child: Icon(Icons.delete),
            ),
          );
        }
    );
  }
}
