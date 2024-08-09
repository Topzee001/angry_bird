import 'package:angry_bird/levels/level1.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/material.dart';

import '../levels/level2.dart';
import '../levels/level3.dart';
import '../levels/level4.dart';

class GameScreen extends StatelessWidget {
  final int screen;

  const GameScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    FlameAudio.bgm.pause();
    List<Forge2DGame> screens = [
      Level1(
        popScreen: () {
          FlameAudio.bgm.resume();

          Navigator.pop(context);
        },
        nextLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 1);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
        restartLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 0);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
      Level2(
        popScreen: () {
          FlameAudio.bgm.resume();

          Navigator.pop(context);
        },
        nextLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 2);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
        restartLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 1);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
      Level3(
        popScreen: () {
          FlameAudio.bgm.resume();

          Navigator.pop(context);
        },
        nextLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 3);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
        restartLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 2);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
      Level4(
        popScreen: () {
          FlameAudio.bgm.resume();
          
          Navigator.pop(context);
        },
        nextLevel: () {
          Navigator.pop(context);
        },
        restartLevel: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const GameScreen(screen: 3);
              },
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
    ];
    return GameWidget(game: screens[screen]);
  }
}
