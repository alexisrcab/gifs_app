// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/gif_model.dart';
import 'package:gifs_app/src/models/gif_response_model.dart';

class GiphyApi {
  final Dio client = Dio();
  final String apiKey = 'NZmDTVOr91T7skW6gwU3UGLWeOicV8gO';

  Future<List<GifModel>?> searchGifs(String query) async {
    final resp = await client.get(
        'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=8');

    final data = GifResponse.fromJson(resp.data);

    print(resp);

    return null;
  }

  Future<GifResponse?> getTrendingRaw({required int index}) async {
    final res = await client
        .get('https://api.giphy.com/v1/gifs/trending', queryParameters: {
      'api_key': apiKey,
      'limit': 8,
      'offset': index,
    });

    final data = GifResponse.fromJson(res.data);

    return res.statusCode == 200 ? data : null;
  }
}

final giphyApiProvider = Provider<GiphyApi>((ref) {
  return GiphyApi();
});
