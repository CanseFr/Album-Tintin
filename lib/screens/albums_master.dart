import 'package:flutter/material.dart';
import 'package:tintinapp/models/album.dart';
import 'package:tintinapp/screens/albums_favorite.dart';
import 'package:tintinapp/services/album_service.dart';
import 'albums_info.dart';

class MyHomePageAlbum extends StatefulWidget {
  const MyHomePageAlbum({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePageAlbum> createState() => _MyHomePageAlbumState();
}

class _MyHomePageAlbumState extends State<MyHomePageAlbum> {

  late Future<List<Album>> _albumsFuture;
  Set<int> faveList = Set<int>();

  @override
  void initState() {
    super.initState();
    _albumsFuture = AlbumService.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Text("Consulter votre liste de lecture "),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlbumsFavorite(faveList: faveList)),
              );
            },
          ),
        ],
      ),

      body: Center(

        child: FutureBuilder<List<Album>>(
          future: _albumsFuture,

          builder: (context, AsyncSnapshot<List<Album>> snapshot) {

            // VERIF REQUEST
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Aucun album disponible');
            } else {

              return ListView.builder(
                itemCount: snapshot.data!.length,

                itemBuilder: (context, index) {
                  var album = snapshot.data![index];

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


                              IconButton(
                                icon: Icon(Icons.favorite_border,
                                    color: faveList.contains(album.number) ? Colors.red : Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (faveList.contains(album.number)) {
                                      faveList.remove(album.number);
                                    } else {
                                      faveList.add(album.number);
                                    }
                                  });
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
      ),
    );
  }
}
