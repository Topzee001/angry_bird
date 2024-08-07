import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class ScoreEffect extends TextComponent {
  ScoreEffect(Vector2 position, int points)
      : super(
          text: '+$points',
          position: position,
          anchor: Anchor.center,
          textRenderer: TextPaint(
            style: TextStyle(
              fontSize: 24,
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

// @override
// Future<void> onLoad() async {
//   add(MoveEffect.by(
//     offset: Vector2(0, -30), // Move up 30 pixels
//     duration: 0.5,
//     curve: Curves.easeOut,
//     onComplete: () {
//       removeFromParent();
//     },
//   ));
//   await super.onLoad();
// }
}
