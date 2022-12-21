import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/simple_gif.dart';
import 'package:gifs_app/src/providers/gifs/gifs_provider.dart';

class GifCachedContainer extends ConsumerWidget {
  final SimpleGif gif;

  const GifCachedContainer({super.key, required this.gif});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onLongPress: () {
        ref.read(gifsProvider.notifier).removeOne(gif.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gif eliminado de favoritos'),
          ),
        );
      },
      child: SizedBox(
        height: 400,
        child: Card(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: gif.url,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
