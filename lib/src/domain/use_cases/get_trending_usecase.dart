import 'package:gifs_app/src/domain/repository/igifs_repository.dart';
import 'package:gifs_app/src/domain/use_cases/interfaces/iget_trending_usecase.dart';

class GetTrendingUseCase extends IGetTrendingUseCase {
  final IGifsRepository repository;

  GetTrendingUseCase({required this.repository});

  @override
  Future getTrending() async {
    return await repository.getTrending();
  }
}
