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

    addStructure();
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

  Future<void> addStructure() async {
    await world.addAll(
      [
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 1.2, 10),
            brickSize: BrickSize.size70x140),
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 1.6, 10),
            brickSize: BrickSize.size70x140),
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 2.4, 10),
            brickSize: BrickSize.size70x140),
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 2.4 + 5, 0),
            brickSize: BrickSize.size220x70),
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 1.2 - 6, 0),
            brickSize: BrickSize.size220x70),
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 1.4, -2),
            brickSize: BrickSize.size140x70),
        Glass(elements,
            brickPosition: Vector2(camera.visibleWorldRect.right / 1.8, -2),
            brickSize: BrickSize.size140x70),
      ],
    );

    // await Future<void>.delayed(const Duration(milliseconds: 2000));
    final sprite = await loadSprite('Pig_29.webp');
    await world.addAll([
      Enemy(
          position: Vector2(camera.visibleWorldRect.right / 1.4, 5),
          sprite: sprite,
          onContactCallBack: (score) {
            add(ScoreEffect(score, color: Colors.green));
            scoreDisplay.addScore(score);
          }),
      Enemy(
          position: Vector2(camera.visibleWorldRect.right / 2, 5),
          sprite: sprite,
          onContactCallBack: (score) {
            add(ScoreEffect(score, color: Colors.green));
            scoreDisplay.addScore(score);
          }),
      Enemy(
          position: Vector2(camera.visibleWorldRect.right / 1.6, -3),
          sprite: sprite,
          onContactCallBack: (score) {
            add(ScoreEffect(score, color: Colors.green));
            scoreDisplay.addScore(score);
          }),
    ]);
  }
}

// --------LEVEL 1--------//
// Future<void> addStructure() async {
//   await world.addAll(
//     [
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2, 10),
//           brickSize: BrickSize.size70x220),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.6, 10),
//           brickSize: BrickSize.size70x220),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4, 10),
//           brickSize: BrickSize.size70x220),
//       Wood(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4 + 4, 0),
//           brickSize: BrickSize.size220x70),
//       Wood(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2 - 4, 0),
//           brickSize: BrickSize.size220x70),
//     ],
//   );
//
//   // await Future<void>.delayed(const Duration(milliseconds: 2000));
//   final sprite = await loadSprite('Pig_29.webp');
//   await world.addAll([
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.4, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 2, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.6, -3),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//   ]);
// }

// ------ LEVEL 2 -------- //
// Future<void> addStructure() async {
//   final sprite = await loadSprite('Pig_29.webp');
//   await world.addAll(
//     [
//       Stone(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2, 10),
//           brickSize: BrickSize.size70x220),
//       Stone(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.6, 10),
//           brickSize: BrickSize.size70x140),
//       Stone(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4, 10),
//           brickSize: BrickSize.size70x70),
//     ],
//   );
//
//   await world.addAll([
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.2, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.6, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 2.4, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//   ]);
// }

// ----- LEVEL 3 ------- //

// Future<void> addStructure() async {
//   await world.addAll(
//     [
//       Metal(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2, 10),
//           brickSize: BrickSize.size70x140),
//       Metal(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.6, 10),
//           brickSize: BrickSize.size70x140),
//       Metal(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4, 10),
//           brickSize: BrickSize.size70x140),
//       Wood(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4 + 5, 0),
//           brickSize: BrickSize.size220x70),
//       Wood(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2 - 6, 0),
//           brickSize: BrickSize.size220x70),
//       Stone(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.4 - 1, 0),
//           brickSize: BrickSize.size70x140),
//       Stone(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.0 + 1, 0),
//           brickSize: BrickSize.size70x140),
//       Explosives(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.6 - 1, -8),
//           brickSize: BrickSize.size220x70),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.6 - 1, -8),
//           brickSize: BrickSize.size140x70),
//     ],
//   );
//
//   // await Future<void>.delayed(const Duration(milliseconds: 2000));
//   final sprite = await loadSprite('Pig_29.webp');
//   await world.addAll([
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.4, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 2, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.6, -3),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//   ]);
// }

//------ LEVEL 4 -----//

// Future<void> addStructure() async {
//   await world.addAll(
//     [
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2, 10),
//           brickSize: BrickSize.size70x140),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.6, 10),
//           brickSize: BrickSize.size70x140),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4, 10),
//           brickSize: BrickSize.size70x140),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 2.4 + 5, 0),
//           brickSize: BrickSize.size220x70),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.2 - 6, 0),
//           brickSize: BrickSize.size220x70),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.4, -2),
//           brickSize: BrickSize.size140x70),
//       Glass(elements,
//           brickPosition: Vector2(camera.visibleWorldRect.right / 1.8, -2),
//           brickSize: BrickSize.size140x70),
//     ],
//   );
//
//   // await Future<void>.delayed(const Duration(milliseconds: 2000));
//   final sprite = await loadSprite('Pig_29.webp');
//   await world.addAll([
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.4, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 2, 5),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//     Enemy(
//         position: Vector2(camera.visibleWorldRect.right / 1.6, -3),
//         sprite: sprite,
//         onContactCallBack: (score) {
//           add(ScoreEffect(score, color: Colors.green));
//           scoreDisplay.addScore(score);
//         }),
//   ]);
// }
