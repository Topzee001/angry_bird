import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import '../angry_bird.dart';
import 'components.dart';

class Bird extends SpriteComponent
    with CollisionCallbacks, HasGameReference<AngryBird> {
  Bird({
    required this.velocity,
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
          anchor: Anchor.center,
        );

  final Vector2 velocity;

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('angry_bird.png');
    sprite = Sprite(image);

    size = Vector2(50.0, 50.0);
    add(RectangleHitbox()..collisionType = CollisionType.active);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea) {
      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
        //removeFromParent();
        //top edge
      } else if (intersectionPoints.first.x <= 0) {
        velocity.x = -velocity.x;
        //left edge
      } else if (intersectionPoints.first.x >= game.width) {
        velocity.x = -velocity.x;
        //removeFromParent();
        //right edge
      } else if (intersectionPoints.first.y >= game.height) {
        // velocity.y = Vector2.zero() as double;
        velocity.y = -velocity.y;
        // removeFromParent();
        //bottom edge
      }
    } else {
      debugPrint('collision with $other');
    }
  }
}
