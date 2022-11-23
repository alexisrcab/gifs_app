import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/models/gif_model.dart';
import 'package:gifs_app/providers/repository/gifs_repository_provider.dart';
import 'package:gifs_app/services/gifs_repository.dart';

final trendigProvider =
    StateNotifierProvider<TrendingStateNotifier, List<GifModel>>((ref) {
  return TrendingStateNotifier(repository: ref.watch(gifsRepositoryProvider));
});

class TrendingStateNotifier extends StateNotifier<List<GifModel>> {
  final GifsRepository repository;

  TrendingStateNotifier({required this.repository}) : super([]) {
    _inital();
  }

  _inital() async {
    state = await repository.getTrending();
  }
}
