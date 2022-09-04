import 'package:flutter_test/flutter_test.dart';
import 'package:gifs_app/src/data/data_sources/remote/giphy_api.dart';

void main() {
  test('Api Test', () {
    final api = GiphyApi();

    api.getTrendingRaw();
  });
}
