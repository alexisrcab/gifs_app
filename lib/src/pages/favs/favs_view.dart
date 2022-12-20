import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/pages/favs/widgets/gif_cached_container.dart';
import 'package:gifs_app/src/providers/gifs/gifs_provider.dart';

class FavsView extends ConsumerWidget {
  const FavsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gifs = ref.watch(gifsProvider);

    return Scaffold(
      body: gifs.isEmpty
          ? const Center(
              child: Text('No hay gifs favoritos'),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final gif = gifs[index];

                      return GifCachedContainer(gif: gif);
                    },
                    childCount: gifs.length,
                  ),
                )
              ],
            ),
    );
  }
}
