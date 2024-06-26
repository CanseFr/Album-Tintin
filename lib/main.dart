import 'package:flutter/material.dart';
import 'package:tintinapp/screens/albums_master.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Tintin Gallery',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.red,
          secondary: Colors.black,
          tertiary: Color.fromARGB(173, 44, 43, 43),

      ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),

      home: const MyHomePageAlbum(title: 'Albums'),

    );
  }
}
