import 'package:flutter/material.dart';

import 'pages/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(useMaterial3: true),
    ),
  );
}
