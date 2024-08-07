import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/my_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameWidget.controlled(
      gameFactory: AngryBirds.new,
    );
  }
}
