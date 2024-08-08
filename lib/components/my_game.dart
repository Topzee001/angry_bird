import 'dart:async';
import 'dart:math';

import 'package:angry_bird/components/score_display.dart';
import 'package:angry_bird/components/score_effect.dart';
import 'package:angry_bird/components/word/enemy.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_kenney_xml/flame_kenney_xml.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enemy.dart';
import 'word/brick.dart';
import 'word/ground.dart';
import 'actors/bird.dart';

class AngryBirds extends Forge2DGame {
  late final XmlSpriteSheet aliens;
  late final XmlSpriteSheet elements;
  late final XmlSpriteSheet tiles;

  // late Bird currentBird;
  // late AngryBirdsCamera gameCamera;
  // late ScoreDisplay scoreDisplay;
  // late RestartButton restartButton;
  // late SoundManager soundManager;

  AngryBirds() : super(gravity: Vector2(0, 40.0));

  late ScoreDisplay scoreDisplay;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('birds_intro.mp3');
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
    await addPlayer();
  }

  @override
  void onRemove() {
    FlameAudio.bgm.stop();
    FlameAudio.bgm.dispose();
    super.onRemove();
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
      final type = BrickType.randomType;
      final size = BrickSize.randomSize;
      await world.add(
        Brick(
            type: type,
            size: size,
            damage: BrickDamage.none,
            position: Vector2(
                camera.visibleWorldRect.right / 1.6 +
                    (_random.nextDouble() * 5 - 2.5),
                0),
            sprites: brickFileNames(type, size).map(
              (key, filename) => MapEntry(
                key,
                elements.getSprite(filename),
              ),
            ),
            onContactCallback: (score) {
              if (score != null) {
                add(ScoreEffect(score));
                scoreDisplay.addScore(score);
              }
            }),
      );
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
  }

  Future<void> addPlayer() async {
    final sprite = await loadSprite('Red.png');
    return world.add(
      Bird(
        position: Vector2(camera.visibleWorldRect.left * 2 / 5, 0),
        sprite: sprite,
      ),
    );
  }

  //Function to add the player back
  @override
  void update(double dt) {
    super.update(dt);

    if (isMounted &&
        world.children.whereType<Bird>().isEmpty &&
        world.children.whereType<Enemy>().isNotEmpty) {
      addPlayer();
    }
    if (isMounted &&
        enemiesFullyAdded &&
        world.children.whereType<Enemy>().isEmpty &&
        world.children.whereType<TextComponent>().isEmpty) {
      world.addAll(
        [
          (position: Vector2(0.5, 0.5), color: Colors.white),
          (position: Vector2.zero(), color: Colors.orangeAccent),
        ].map(
          (e) => TextComponent(
            text: 'You win!',
            anchor: Anchor.center,
            position: e.position,
            textRenderer: TextPaint(
              style: TextStyle(color: e.color, fontSize: 16),
            ),
          ),
        ),
      );
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
