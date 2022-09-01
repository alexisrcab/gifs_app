import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/presentation/providers/ui/ui_provider.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(uiProvider);

    return NavigationBar(
      selectedIndex: ui,
      onDestinationSelected: (newIndex) {
        ref.read(uiProvider.notifier).state = newIndex;
      },
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.favorite),
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.explore),
          icon: Icon(Icons.explore_outlined),
          label: 'Trending',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
    );
  }
}
