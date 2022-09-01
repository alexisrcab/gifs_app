import 'package:gifs_app/src/domain/entities/egif.dart';

abstract class IGifsRepository {
  Future<EGif?> getTrending();
  Future<EGif?> searchGifs(String query);
}
