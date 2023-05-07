import 'dart:convert';
import 'package:http/http.dart';
import '../models/index.dart';

class UnsplashApi {
  UnsplashApi(this._client, this._apiKey);

  final Client _client;
  final String _apiKey;

  Future<List<Picture>> getImages({required int page, required String search}) async {
    final Uri uri = Uri.parse('https://api.unsplash.com/search/photos?query=$search&per_page=30&page=$page');

    final Response response = await _client.get(uri, headers: <String, String>{'Authorization': 'Client-ID $_apiKey'});
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> imageResults = result['results'] as List<dynamic>;

      return imageResults
          .cast<Map<dynamic, dynamic>>()
          .map((Map<dynamic, dynamic> json) => Picture.fromJson(json))
          .toList();
    }
    throw StateError(response.body);
  }
}
