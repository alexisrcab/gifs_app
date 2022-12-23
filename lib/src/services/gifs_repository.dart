import 'package:gifs_app/src/api/giphy_api.dart';
import 'package:gifs_app/src/models/gif_model.dart';

class GifsRepository {
  final GiphyApi api;

  GifsRepository({required this.api});

  Future<List<GifModel>> getTrending({required int index}) async {
    final res = await api.getTrendingRaw(index: index);

    if (res == null) throw Exception('No data found');

    return res.data!;
  }

  Future<List<GifModel>> searchGifs(String query) async {
    final res = await api.searchGifs(query);

    if (res == null) throw Exception('No data found');

    return res.data!;
  }
}
