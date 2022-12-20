import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/simple_gif.dart';
import 'package:isar/isar.dart';

final gifsProvider =
    StateNotifierProvider<GifsNotifier, List<SimpleGif>>((ref) {
  return GifsNotifier();
});

class GifsNotifier extends StateNotifier<List<SimpleGif>> {
  late Isar _isar;

  GifsNotifier() : super([]) {
    _init();
  }

  _init() async {
    _isar = await Isar.open([SimpleGifSchema]);
  }

  getAll() async {
    await _isar.txn(() async {
      state = await _isar.simpleGifs.where().findAll();
    });
  }

  addGif(SimpleGif newGif) async {
    await _isar.writeTxn(() async {
      await _isar.simpleGifs.put(newGif);
    });

    state = [...state, newGif];
  }
}
