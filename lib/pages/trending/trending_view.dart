import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/providers/trending/trending_provider.dart';

class TrendingView extends ConsumerWidget {
  const TrendingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trending = ref.watch(trendigProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SizedBox(
                  height: 300,
                  child: GridTile(
                    child: Card(
                      child: Image(
                        image: NetworkImage(
                          trending[index].images!.original!.url!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              childCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
