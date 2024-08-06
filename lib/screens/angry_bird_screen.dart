import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../src/angry_bird.dart';

class AngryBirdScreen extends StatelessWidget {
  const AngryBirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = AngryBird();
    return GameWidget(game: game);
  }
}
