import 'package:isar/isar.dart';

part 'simple_gif.g.dart';

@collection
class SimpleGif {
  Id id = Isar.autoIncrement;
  final String title;
  final String url;
  final String apiId;

  SimpleGif({required this.title, required this.url, required this.apiId});
}
