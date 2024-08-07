import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreDisplay extends TextComponent {
  int score = 0;

  ScoreDisplay({Vector2? position})
      : super(
          text: 'Score: 0',
          position: position ?? Vector2(20, 20),
          textRenderer: TextPaint(
            style: TextStyle(
                fontFamily: "AngryBirds", color: Colors.white, fontSize: 42),
          ),
        );

  void addScore(int newScore) {
    score += newScore;
    text = 'Score: $score';
  }
}
