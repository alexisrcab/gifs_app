import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/data/data_sources/remote/giphy_api.dart';
import 'package:gifs_app/src/data/repositories/gifs_repository.dart';
import 'package:gifs_app/src/domain/repository/igifs_repository.dart';

final repositoryProvider = Provider<IGifsRepository>((ref) {
  return GifsRepository(service: GiphyApi());
});
