import 'package:gifs_app/src/domain/entities/egif.dart';

abstract class IGifsRepository {
  Future<EGif> searchGifs(String query);
  Future<EGif> getTrending();
}
