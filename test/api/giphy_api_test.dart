import 'package:flutter_test/flutter_test.dart';
import 'package:gifs_app/src/api/giphy_api.dart';

void main() {
  test('Api Test', () async {
    final api = GiphyApi();

    final res = await api.getTrendingRaw(index: 1);
  });
}
