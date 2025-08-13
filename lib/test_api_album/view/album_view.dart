import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unit_testing_in_flutter/test_api_album/models/api_album.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album View'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchAlbum(dio: Dio()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.data.title),
                  leading: Text(snapshot.data.id.toString()),
                  trailing: Icon(Icons.photo_album),
                ),
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Container();
          },
        ),
      ),
    );
  }
}
