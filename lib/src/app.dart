import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/pages/home/home_view.dart';
import 'package:gifs_app/src/providers/gifs/gifs_provider.dart';

class GifsApp extends ConsumerWidget {
  const GifsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gifsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gifs App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomeView(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          height: 70,
          indicatorColor: Colors.indigoAccent,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(fontSize: 14, color: Colors.black);
            }

            return const TextStyle(fontSize: 14, color: Colors.grey);
          }),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Colors.white);
            }

            return const IconThemeData(color: Colors.grey);
          }),
        ),
      ),
    );
  }
}
