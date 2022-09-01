import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/presentation/providers/trending/trending_provider.dart';

class TrendingView extends ConsumerWidget {
  const TrendingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trending = ref.watch(trendingProvider);

    return Scaffold(
      body: const Center(
        child: Text('Hola mundo'),
      ),
    );
  }
}
