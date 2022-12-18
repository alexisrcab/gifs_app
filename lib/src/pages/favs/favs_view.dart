import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/providers/gifs/gifs_provider.dart';

class FavsView extends ConsumerWidget{
  const FavsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gifs = ref.watch(gifsProvider);

    return const Scaffold(
      body: Center(
        child: Text('Deberia de mostras gifs guardados'),
      ),
    );
  }
}
