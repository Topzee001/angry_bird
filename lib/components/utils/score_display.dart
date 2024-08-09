import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreDisplay extends TextComponent {
  int score = 0;

  ScoreDisplay({Vector2? position})
      : super(
          text: 'Score: 0',
          position: position ?? Vector2(25, 25),
          textRenderer: TextPaint(
            style: const TextStyle(
                fontFamily: "AngryBirds", color: Colors.white, fontSize: 42),
          ),
        );

  void addScore(int newScore) {
    score += newScore;
    text = 'Score: $score';
  }
}
