import 'package:dio/dio.dart';

  Future<AlbumModel> fetchAlbum({required Dio dio}) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      return AlbumModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }


class AlbumModel {
  final int userId;
  final int id;
  final String title;
  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
