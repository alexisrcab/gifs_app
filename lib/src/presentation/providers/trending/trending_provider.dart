import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/domain/models/gif_model.dart';
import 'package:gifs_app/src/domain/use_cases/interfaces/iget_trending_usecase.dart';
import 'package:gifs_app/src/domain/use_cases/providers/get_trending_usecase_provider.dart';

final trendingProvider =
    StateNotifierProvider<TrendingNotifier, List<GifModel>>((ref) {
  return TrendingNotifier(
      getTrendingUseCase: ref.read(getTrendingUseCaseProvider));
});

class TrendingNotifier extends StateNotifier<List<GifModel>> {
  final IGetTrendingUseCase getTrendingUseCase;

  TrendingNotifier({required this.getTrendingUseCase}) : super([]) {
    _initial();
  }

  _initial() async {
    state = await getTrendingUseCase.getTrending();
  }
}
