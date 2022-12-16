import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/providers/trending/trending_provider.dart';

class TrendingView extends ConsumerStatefulWidget {
  const TrendingView({Key? key}) : super(key: key);

  @override
  ConsumerState<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends ConsumerState<TrendingView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (checkScroll()) {
        print('Fetch more');
      }
    });
  }

  bool checkScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentPosition = _scrollController.position.pixels;

    return currentPosition >= (maxScroll * 0.92);
  }

  @override
  Widget build(BuildContext context) {
    final trending = ref.watch(trendigProvider);

    return Scaffold(
      body: trending.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
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
                                trending.gifs[index].images!.original!.url!,
                              ),
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }

                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: trending.gifs.length,
                  ),
                )
              ],
              controller: _scrollController,
            ),
    );
  }
}
