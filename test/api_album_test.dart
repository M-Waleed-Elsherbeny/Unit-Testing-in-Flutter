import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing_in_flutter/test_api_album/models/api_album.dart';

import 'api_album_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  setUp(() {
    mockDio = MockDio();
  });
  test("Test fetchAlbum() Response", () async {
    when(
      mockDio.get("https://jsonplaceholder.typicode.com/albums/1"),
    ).thenAnswer((_) async {
      return Response(
        requestOptions: RequestOptions(
          path: "https://jsonplaceholder.typicode.com/albums/1",
          data: {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
        ),
        statusCode: 200,
      );
    });
    expect(await fetchAlbum(dio: mockDio), isA<AlbumModel>());
  });
}
