import 'package:dio/dio.dart';
import 'package:gifs_app/src/domain/models/gif_model.dart';
import 'package:gifs_app/src/domain/models/gif_response_model.dart';

class GiphyApi {
  final Dio client = Dio();
  final String apiKey = 'NZmDTVOr91T7skW6gwU3UGLWeOicV8gO';

  Future<List<GifModel>?> searchGifs(String query) async {
    final resp = await client
        .get('https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query');

    final data = GifResponse.fromJson(resp.data);

    print(resp);

    return null;
  }

  Future<GifResponse?> getTrendingRaw() async {
    final res = await client
        .get('https://api.giphy.com/v1/gifs/trending?api_key=$apiKey');

    final data = GifResponse.fromJson(res.data);

    print(data.toJson());

    return res.statusCode == 200 ? data : null;
  }
}
