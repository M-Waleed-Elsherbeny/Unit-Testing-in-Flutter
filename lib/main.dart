import 'package:flutter/material.dart';
import 'package:unit_testing_in_flutter/test_api_album/view/album_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Unit Testing in Flutter', home: AlbumView());
  }
}
