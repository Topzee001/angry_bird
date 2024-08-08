import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'bird.dart';
import 'body_component_with_user_data.dart';

const enemySize = 5.0;

class Enemy extends BodyComponentWithUserData with ContactCallbacks {
  void Function(int score)? onContactCallBack;

  Enemy(
      {required Vector2 position,
      required Sprite sprite,
      this.onContactCallBack})
      : super(
          renderBody: false,
          bodyDef: BodyDef()
            ..position = position
            ..type = BodyType.dynamic,
          fixtureDefs: [
            FixtureDef(
              PolygonShape()..setAsBoxXY(enemySize / 2, enemySize / 2),
              friction: 0.3,
            )
          ],
          children: [
            SpriteComponent(
              anchor: Anchor.center,
              sprite: sprite,
              size: Vector2.all(enemySize),
              position: Vector2(0, 0),
            ),
          ],
        );

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Bird) {
      int interceptVelocity =
          (contact.bodyA.linearVelocity - contact.bodyB.linearVelocity)
              .length
              .abs()
              .toInt();
      if (interceptVelocity > 20) {
        onContactCallBack!(15000);
        removeFromParent();
      }
    }
    super.beginContact(other, contact);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (position.x > camera.visibleWorldRect.right + 10 ||
        position.x < camera.visibleWorldRect.left - 10) {
      removeFromParent();
    }
  }
}
