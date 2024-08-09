
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class PauseButton extends ButtonComponent {
  PauseButton(
      {required Vector2 position,
      required Sprite sprite,
      required VoidCallback pausePressed})
      : super(
          button: CircleComponent(
              radius: 30,
              paint: Paint()..color = Colors.grey.withOpacity(0.01),
              children: [
                SpriteComponent(
                  sprite: sprite,
                ),
              ]),
          position: position,
        ) {
    onPressed = pausePressed;
  }
}

class RestartButton extends ButtonComponent {
  RestartButton({
    required Vector2 position,
    required Sprite sprite,
    required VoidCallback onPressed,
  }) : super(
          button: CircleComponent(
              radius: 60,
              paint: Paint()..color = Colors.grey.withOpacity(0.7),
              children: [
                SpriteComponent(sprite: sprite, size: Vector2.all(120)),
              ]),
          position: position,
          onPressed: onPressed,
        );
}

class ExitButton extends ButtonComponent {
  ExitButton(
      {required Vector2 position,
      required Sprite sprite,
      required VoidCallback onPressed})
      : super(
          button: CircleComponent(
              radius: 60,
              paint: Paint()..color = Colors.grey.withOpacity(0.01),
              children: [
                SpriteComponent(sprite: sprite, size: Vector2.all(120)),
              ]),
          position: position,
          onPressed: onPressed,
        );
}

class PlayButton extends ButtonComponent {
  PlayButton(
      {required Vector2 position,
      required Sprite sprite,
      required VoidCallback onPressed})
      : super(
          button: CircleComponent(
              radius: 60,
              paint: Paint()..color = Colors.grey.withOpacity(0.01),
              children: [
                SpriteComponent(sprite: sprite, size: Vector2.all(120)),
              ]),
          position: position,
          onPressed: onPressed,
        );
}
