import 'package:gifs_app/src/domain/models/gif_model.dart';

abstract class IGifsRepository {
  Future<List<GifModel>> getTrending();
  Future<List<GifModel>> searchGifs(String query);
}
