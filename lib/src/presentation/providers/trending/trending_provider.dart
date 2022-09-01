import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/domain/entities/egif.dart';
import 'package:gifs_app/src/domain/use_cases/interfaces/iget_trending_usecase.dart';
import 'package:gifs_app/src/domain/use_cases/providers/get_trending_usecase_provider.dart';

final trendingProvider =
    StateNotifierProvider<TrendingNotifier, List<EGif>>((ref) {
  return TrendingNotifier(
      getTrendingUseCase: ref.read(getTrendingUseCaseProvider));
});

class TrendingNotifier extends StateNotifier<List<EGif>> {
  final IGetTrendingUseCase getTrendingUseCase;

  TrendingNotifier({required this.getTrendingUseCase}) : super([]) {
    _initial();
  }

  _initial() async {
    await getTrendingUseCase.getTrending();
  }
}
