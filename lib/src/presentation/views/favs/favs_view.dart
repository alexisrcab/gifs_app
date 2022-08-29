import 'package:flutter/material.dart';

class FavsView extends StatelessWidget {
  const FavsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ]),
      body: const Center(
        child: Text('Hola mundo'),
      ),
    );
  }
}
