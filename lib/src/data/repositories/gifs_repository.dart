import 'package:gifs_app/src/data/data_sources/remote/giphy_api.dart';
import 'package:gifs_app/src/domain/entities/egif.dart';
import 'package:gifs_app/src/domain/repository/igifs_repository.dart';

class GifsRepository extends IGifsRepository {
  final GiphyApi service;

  GifsRepository({required this.service});

  @override
  Future<EGif?> getTrending() async {
    final res = await service.getTrending();

    return null;
  }

  @override
  Future<EGif> searchGifs(String query) {
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}
