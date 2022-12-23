import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/gif_model.dart';
import 'package:gifs_app/src/providers/repository/gifs_repository_provider.dart';

final searchProvider =
    FutureProvider.family<List<GifModel>, String>((ref, query) async {
  return await ref.watch(gifsRepositoryProvider).searchGifs(query);
});
