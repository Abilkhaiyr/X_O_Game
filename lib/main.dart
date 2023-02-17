import 'package:flutter/material.dart';
import 'package:my_xo/game_page.dart';

void main() {
  runApp(const GameXO());
}

class GameXO extends StatelessWidget {
  const GameXO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GamePage(),
    );
  }
}
