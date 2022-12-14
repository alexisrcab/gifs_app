import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/pages/favs/favs_view.dart';
import 'package:gifs_app/src/pages/home/widgets/nav_bar.dart';
import 'package:gifs_app/src/pages/trending/trending_view.dart';
import 'package:gifs_app/src/providers/ui/ui_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  final List<Widget> pages = const [
    FavsView(),
    TrendingView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(uiProvider);

    return Scaffold(
      body: pages.elementAt(ui),
      bottomNavigationBar: const NavBar(),
    );
  }
}
