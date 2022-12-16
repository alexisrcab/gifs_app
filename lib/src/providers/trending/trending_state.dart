import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gifs_app/src/models/gif_model.dart';

part 'trending_state.freezed.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState({
    required List<GifModel> gifs,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadMoreError,
    @Default(false) bool isLoadMoreDone,
  }) = _TrendingState;
}
