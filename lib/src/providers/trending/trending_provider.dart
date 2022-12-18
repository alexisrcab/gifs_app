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
    final gifs = await repository.getTrending(index: 0);

    state = state.copyWith(isLoading: false, gifs: gifs);
  }

  nextPage() async {
    // TODO: Error handling

    if (state.isLoading) {
      return;
    }

    state = state.copyWith(
        isLoading: true, isLoadMoreDone: false, isLoadMoreError: false);

    final offset = state.gifs.length;

    final gifs = await repository.getTrending(index: offset);

    if (gifs.isNotEmpty) {
      state = state.copyWith(
          isLoading: false,
          isLoadMoreDone: gifs.isEmpty,
          gifs: [...state.gifs, ...gifs]);
    } else {
      state = state.copyWith(
        isLoading: false,
        isLoadMoreDone: gifs.isEmpty,
      );
    }
  }
}
