import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/api/giphy_api.dart';
import 'package:gifs_app/src/services/gifs_repository.dart';

final gifsRepositoryProvider = Provider<GifsRepository>((ref) {
  return GifsRepository(
    api: ref.watch(giphyApiProvider),
  );
});
