import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class RestartButton extends ButtonComponent {
  RestartButton()
      : super(
          button: RectangleComponent(
            size: Vector2(100, 50),
            paint: Paint()..color = Colors.blue,
          ),
          children: [
            TextComponent(text: 'Restart'),
          ],
          position: Vector2(150, 50),
        ) {
    onPressed = () {
      // Restart game logic
    };
  }
}
