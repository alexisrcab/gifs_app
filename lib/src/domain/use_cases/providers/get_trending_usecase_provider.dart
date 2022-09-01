import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/data/providers/repository_provider.dart';
import 'package:gifs_app/src/domain/use_cases/get_trending_usecase.dart';
import 'package:gifs_app/src/domain/use_cases/interfaces/iget_trending_usecase.dart';

final getTrendingUseCaseProvider = Provider<IGetTrendingUseCase>((ref) {
  return GetTrendingUseCase(
    repository: ref.read(repositoryProvider),
  );
});
