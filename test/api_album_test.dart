import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mock;
import 'package:unit_testing_in_flutter/test_api_album/models/api_album.dart';

import 'api_album_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group("Fetch Album Test", () {
    late MockDio mockDio;
    setUp(() { // Registers a function to be run before tests
      mockDio = MockDio();
    });
    // tearDown(body) ==> Registers a function to be run after tests.
    test("Test fetchAlbum() Response", () async {
      mock
          .when(mockDio.get("https://jsonplaceholder.typicode.com/albums/1"))
          .thenAnswer((_) async {
            return Response(
              requestOptions: RequestOptions(
                path: "https://jsonplaceholder.typicode.com/albums/1",
              ),
              statusCode: 200,
              data: {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
            );
          });
      expect(await fetchAlbum(dio: mockDio), isA<AlbumModel>());
    });
    test("Exception throw request with an error", () {
      mock
          .when(mockDio.get("https://jsonplaceholder.typicode.com/albums/1"))
          .thenAnswer((_) async {
            return Response(
              requestOptions: RequestOptions(
                path: "https://jsonplaceholder.typicode.com/albums/1",
              ),
              statusCode: 404,
              data: {"MsgError": "Page Not Found"},
            );
          });
      expect(fetchAlbum(dio: mockDio), throwsException); // Matcher
    });
    test("Check Validate", () async {
      mock
          .when(mockDio.get("https://jsonplaceholder.typicode.com/albums/1"))
          .thenAnswer((_) async {
            return Response(
              requestOptions: RequestOptions(
                path: "https://jsonplaceholder.typicode.com/albums/1",
              ),
              statusCode: 200,
              data: {"userId": 1, "id": 3, "title": "Fake Data"},
            );
          });
      expect(
        await fetchAlbum(dio: mockDio),
        isA<AlbumModel>().having(
          (album) => album.title,
          "Check Title",
          "Fake Data",
        ).having((album) => album.id, "Check Id", 3),
      );
    });
  });
}
