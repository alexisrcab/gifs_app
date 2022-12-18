import 'package:flutter/material.dart';
import 'package:gifs_app/src/models/gif_model.dart';

class GifContainer extends StatelessWidget {
  final GifModel gif;

  const GifContainer({super.key, required this.gif});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print('Hello');
      },
      child: SizedBox(
        height: 300,
        child: Card(
          child: Image(
            width: 300,
            image: NetworkImage(
              gif.images!.original!.url!,
            ),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
