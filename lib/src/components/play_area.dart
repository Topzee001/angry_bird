import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../angry_bird.dart';

class PlayArea extends PositionComponent with HasGameReference<AngryBird> {
  late SpriteComponent background;
  PlayArea() : super(children: [RectangleHitbox()]);

  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    super.onLoad();
    size = Vector2(game.width, game.height);

    background = SpriteComponent(
      sprite: await Sprite.load('background.jpg'),
      size: size,
    );
    add(background);
  }
}
