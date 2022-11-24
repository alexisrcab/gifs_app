import 'package:flutter_test/flutter_test.dart';
import 'package:gifs_app/src/api/giphy_api.dart';

void main() {
  test('Api Test', () {
    final api = GiphyApi();

    api.getTrendingRaw();
  });
}
