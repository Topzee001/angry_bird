import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'dart:math' as math;

import 'components/components.dart';
import 'config.dart';

class AngryBird extends FlameGame with HasCollisionDetection {
  AngryBird()
      : super(
            camera: CameraComponent.withFixedResolution(
          width: gameWIdth,
          height: gameHeight,
        ));

  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());

    world.add(Bird(
        velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2)
            .normalized()
          ..scale(height / 4),
        position: size / 2,
        size: Vector2(50, 50)
        //radius: birdRadius,
        ));

    //debugMode = true;
  }
}
