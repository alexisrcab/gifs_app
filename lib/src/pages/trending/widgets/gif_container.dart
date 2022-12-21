import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/models/gif_model.dart';
import 'package:gifs_app/src/models/simple_gif.dart';
import 'package:gifs_app/src/providers/gifs/gifs_provider.dart';

class GifContainer extends ConsumerWidget {
  final GifModel gif;

  const GifContainer({super.key, required this.gif});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onLongPress: () {
        final newGif = SimpleGif(
          apiId: gif.id!,
          url: gif.images!.downsized!.url!,
          title: gif.title!,
        );

        ref.read(gifsProvider.notifier).addGif(newGif);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Agregado a favoritos'),
          ),
        );
      },
      child: SizedBox(
        height: 400,
        child: Card(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: gif.images!.downsized!.url!,
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
