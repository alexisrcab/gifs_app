import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/simple_gif.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider<Future<Isar>>((ref) async {
  return await Isar.open([SimpleGifSchema]);
});
