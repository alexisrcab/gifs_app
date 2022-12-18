import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/simple_gif.dart';
import 'package:gifs_app/src/providers/isar/isar_provider.dart';
import 'package:isar/isar.dart';

final gifsProvider =
    StateNotifierProvider<GifsNotifier, IsarCollection<SimpleGif>>((ref) async {
  return GifsNotifier((await ref.watch(isarProvider)).collection<SimpleGif>());
});

class GifsNotifier extends StateNotifier<IsarCollection<SimpleGif>> {
  GifsNotifier(super.state);
}
