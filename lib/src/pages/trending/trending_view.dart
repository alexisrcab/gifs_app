import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/pages/trending/widgets/gif_container.dart';
import 'package:gifs_app/src/providers/trending/trending_provider.dart';

class TrendingView extends ConsumerStatefulWidget {
  const TrendingView({Key? key}) : super(key: key);

  @override
  ConsumerState<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends ConsumerState<TrendingView> {
  final _scrollController = ScrollController();

  void _onScroll() {
    if (_isBottom) {
      ref.read(trendigProvider.notifier).nextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trending = ref.watch(trendigProvider);

    return Scaffold(
      body: trending.gifs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final gif = trending.gifs[index];

                      return GifContainer(gif: gif);
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
