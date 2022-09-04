import 'package:gifs_app/src/data/data_sources/remote/giphy_api.dart';
import 'package:gifs_app/src/domain/models/gif_model.dart';
import 'package:gifs_app/src/domain/repository/igifs_repository.dart';

class GifsRepository extends IGifsRepository {
  final GiphyApi service;

  GifsRepository({required this.service});

  @override
  Future<List<GifModel>> getTrending() async {
    final res = await service.getTrendingRaw();

    if (res == null) throw Exception('No data found');

    return res.data!;
  }

  @override
  Future<List<GifModel>> searchGifs(String query) {
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}
