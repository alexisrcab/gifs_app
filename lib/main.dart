import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/src/app.dart';
import 'package:gifs_app/src/logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const GifsApp(),
    ),
  );
}
