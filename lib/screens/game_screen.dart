import 'package:angry_bird/levels/level1.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/material.dart';

import '../levels/level2.dart';

class GameScreen extends StatelessWidget {
  final int screen;

  const GameScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    List<Forge2DGame> screens = [
      Level1(popScreen: () {
        Navigator.pop(context);
      }),
      Level2(popScreen: () {
        Navigator.pop(context);
      }),
      Level1(popScreen: () {
        Navigator.pop(context);
      }),
      Level1(popScreen: () {
        Navigator.pop(context);
      }),
    ];
    return GameWidget(game: screens[screen]);
  }
}

class GameScreen2 extends StatelessWidget {
  const GameScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: Level2(popScreen: () {
        Navigator.pop(context);
      }),
    );
  }
}

class GameScreen3 extends StatelessWidget {
  const GameScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: Level1(popScreen: () {
        Navigator.pop(context);
      }),
    );
  }
}

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
