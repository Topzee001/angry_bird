import 'dart:async';
import 'dart:math';

import 'package:angry_bird/components/score_display.dart';
import 'package:angry_bird/components/score_effect.dart';
import 'package:angry_bird/levels/materials.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_kenney_xml/flame_kenney_xml.dart';
import 'package:flutter/material.dart';

import '../components/bird.dart';
import '../components/brick.dart';
import '../components/ground.dart';
import '../components/pig.dart';

class Playground extends Forge2DGame {
  late final XmlSpriteSheet aliens;
  late final XmlSpriteSheet elements;
  late final XmlSpriteSheet tiles;

  Playground() : super(gravity: Vector2(0, 40.0));

  late ScoreDisplay scoreDisplay;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    final spriteSheets = await Future.wait([
      XmlSpriteSheet.load(
        imagePath: 'spritesheet_aliens.png',
        xmlPath: 'spritesheet_aliens.xml',
      ),
      XmlSpriteSheet.load(
        imagePath: 'spritesheet_elements.png',
        xmlPath: 'spritesheet_elements.xml',
      ),
      XmlSpriteSheet.load(
        imagePath: 'spritesheet_tiles.png',
        xmlPath: 'spritesheet_tiles.xml',
      ),
    ]);

    // aliens = spriteSheets[0];
    elements = spriteSheets[1];
    tiles = spriteSheets[2];

    add(SpriteComponent()
      ..sprite = await loadSprite('background.png')
      ..size = size);

    scoreDisplay = ScoreDisplay();
    add(scoreDisplay);

    unawaited(addBricks().then((_) => addEnemies()));
    await addGround();
  }

  Future<void> addGround() {
    return world.addAll([
      for (var x = camera.visibleWorldRect.left;
          x < camera.visibleWorldRect.right + groundSize;
          x += groundSize)
        Ground(
          Vector2(x, (camera.visibleWorldRect.height - groundSize) / 2),
          tiles.getSprite('grass.png'),
        ),
    ]);
  }

  final _random = Random();

  Future<void> addBricks() async {
    for (var i = 0; i < 6; i++) {
      await world.add(
        Wood(
          elements,
          brickPosition: Vector2(
              camera.visibleWorldRect.right / 1.6 +
                  (_random.nextDouble() * 5 - 2.5),
              0),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
  }

  var enemiesFullyAdded = false;

  Future<void> addEnemies() async {
    final sprite = await loadSprite('Pig_29.webp');
    await Future<void>.delayed(const Duration(seconds: 1));
    for (var i = 0; i < 2; i++) {
      await world.add(
        Enemy(
            position: Vector2(
                camera.visibleWorldRect.right / 1.6 +
                    (_random.nextDouble() * 5 - 3.5),
                (_random.nextDouble() * 3)),
            sprite: sprite,
            onContactCallBack: (score) {
              add(ScoreEffect(score, color: Colors.green));
              scoreDisplay.addScore(score);
            }),
      );
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    enemiesFullyAdded = true;
  }
}
