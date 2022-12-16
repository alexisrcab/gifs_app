import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/providers/repository/gifs_repository_provider.dart';
import 'package:gifs_app/src/providers/trending/trending_state.dart';
import 'package:gifs_app/src/services/gifs_repository.dart';

final trendigProvider =
    StateNotifierProvider<TrendingStateNotifier, TrendingState>((ref) {
  return TrendingStateNotifier(repository: ref.watch(gifsRepositoryProvider));
});

class TrendingStateNotifier extends StateNotifier<TrendingState> {
  final GifsRepository repository;

  TrendingStateNotifier({required this.repository})
      : super(const TrendingState(gifs: [])) {
    _inital();
  }

  _inital() async {
    final gifs = await repository.getTrending(index: 1);

    state = state.copyWith(isLoading: false, gifs: gifs);
  }

  nextPage() {}
}
