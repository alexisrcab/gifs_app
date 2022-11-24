import 'package:gifs_app/src/api/giphy_api.dart';
import 'package:gifs_app/src/models/gif_model.dart';

class GifsRepository {
  final GiphyApi api;

  GifsRepository({required this.api});

  Future<List<GifModel>> getTrending() async {
    final res = await api.getTrendingRaw();

    if (res == null) throw Exception('No data found');

    return res.data!;
  }

  Future<List<GifModel>> searchGifs(String query) {
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}
