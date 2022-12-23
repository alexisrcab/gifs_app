import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gifs_app/src/models/gif_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<GifModel> gifs,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadMoreError,
    @Default(false) bool isLoadMoreDone,
  }) = _SearchState;
}
