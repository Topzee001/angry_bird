import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class ScoreEffect extends TextComponent {
  ScoreEffect(int points, {Vector2? position, Color? color})
      : super(
          text: '+$points',
          position: position ?? Vector2(150, 120),
          anchor: Anchor.center,
          textRenderer: TextPaint(
            style: TextStyle(
              fontSize: 20,
              fontFamily: "AngryBirds",
              color: color ?? Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

  @override
  Future<void> onLoad() async {
    add(MoveEffect.by(
      Vector2(0, -20),
      EffectController(
        duration: 1.5,
        curve: Curves.easeInOut,
      ),
      onComplete: () {
        removeFromParent();
      },
    ));

    add(
      ScaleEffect.by(
        Vector2.all(2),
        EffectController(duration: 1),
      ),
    );

    // add(
    //   OpacityEffect.fadeOut(
    //     EffectController(startDelay: 0.3, duration: 0.2),
    //   )..onComplete = () => removeFromParent(),
    // );
    await super.onLoad();
  }
}
