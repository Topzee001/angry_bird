import 'package:angry_bird/components/body_component_with_user_data.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

const playerSize = 5.0;

class Bird extends BodyComponentWithUserData
    with DragCallbacks, ContactCallbacks, TapCallbacks {
  late AudioPool launchSfx;
  late AudioPool flyingSfx;

  Bird({
    required Vector2 position,
    required Sprite sprite,
  })  : _sprite = sprite,
        super(
          renderBody: false,
          bodyDef: BodyDef()
            ..position = position
            ..type = BodyType.static
            ..angularDamping = 0.2
            ..linearDamping = 0.2,
          fixtureDefs: [
            FixtureDef(CircleShape()..radius = playerSize / 2)
              ..restitution = 0.4
              ..density = 0.75
              ..friction = 0.5
          ],
        );

  final Sprite _sprite;

  @override
  Future<void> onLoad() async {
    launchSfx = await AudioPool.create(
        source: AssetSource('audio/sfx/launch.mp3'), maxPlayers: 1);
    flyingSfx = await AudioPool.create(
        source: AssetSource('audio/sfx/flying.mp3'), maxPlayers: 1);
    addAll([
      CustomPainterComponent(
        painter: _DragPainter(this, world.gravity),
        anchor: Anchor.center,
        size: Vector2(100, 100), // Increased size to cover more area
        position: Vector2(0, 0),
      ),
      SpriteComponent(
        anchor: Anchor.center,
        sprite: _sprite,
        size: Vector2(playerSize, playerSize),
        position: Vector2(0, 0),
      )
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!body.isAwake) {
      removeFromParent();
    }

    if (position.x > camera.visibleWorldRect.right + 10 ||
        position.x < camera.visibleWorldRect.left - 10) {
      removeFromParent();
    }
  }

  Vector2 _dragStart = Vector2.zero();
  Vector2 _dragDelta = Vector2.zero();

  Vector2 get dragDelta => _dragDelta;

  @override
  void onDragStart(DragStartEvent event) {
    launchSfx.start(volume: 0.8);

    super.onDragStart(event);
    if (body.bodyType == BodyType.static) {
      _dragStart = event.localPosition;
    }
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (body.bodyType == BodyType.static) {
      Vector2 delta = event.localEndPosition - _dragStart;

      double x = delta.r; //horizontal
      double y = delta.g; //vertical

      if (delta.r <= -10) {
        x = -10;
      }
      if (delta.r >= 0) {
        x = 0;
      }
      if (delta.g <= -5) {
        y = -5;
      }
      if (delta.g >= 8) {
        y = 8;
      }
      _dragDelta = Vector2(x, y);
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    if (body.bodyType == BodyType.static) {
      bool cancel = _dragDelta.r * _dragDelta.g >= -0.05 &&
          _dragDelta.r * _dragDelta.g <= 0.05;
      flyingSfx.start();

      if (!cancel) {
        children
            .whereType<CustomPainterComponent>()
            .firstOrNull
            ?.removeFromParent();
        body.setType(BodyType.dynamic);
        body.applyLinearImpulse(_dragDelta * -80);
        add(RemoveEffect(
          delay: 5.0,
        ));
      }
    }
  }
}

class _DragPainter extends CustomPainter {
  _DragPainter(this.player, this.gravity);

  final Bird player;
  final Vector2 gravity;
  final int numPoints = 15; // Number of points to draw in the trajectory
  final double dotSpacing = 1.2; // Space between dots

  @override
  void paint(Canvas canvas, Size size) {
    bool cancel = player.dragDelta.r * player.dragDelta.g >= -0.05 &&
        player.dragDelta.r * player.dragDelta.g <= 0.05;

    if (player.dragDelta != Vector2.zero() && !cancel) {
      var center = size.center(Offset.zero);
      var initialVelocity = player.dragDelta *
          -5; // Increased multiplier for more visible trajectory

      var points = <Offset>[];
      var time = 0.0;
      var position = Vector2.zero();
      var lastDrawnPoint = Vector2.zero();

      for (int i = 0; i < numPoints; i++) {
        position.x = initialVelocity.x * time;
        position.y = initialVelocity.y * time + 0.5 * gravity.y * time * time;

        var currentPoint = center + position.toOffset();

        // Only add point if it's far enough from the last drawn point
        if (i == 0 ||
            (currentPoint - lastDrawnPoint.toOffset()).distance > dotSpacing) {
          points.add(currentPoint);
          lastDrawnPoint = Vector2(currentPoint.dx, currentPoint.dy);
        }

        time += 0.05; // Time step, adjust as needed
      }

      // Draw dots instead of a continuous line
      for (var point in points) {
        canvas.drawCircle(
            point,
            0.4, // Dot size
            Paint()
              ..color = Colors.white.withOpacity(0.9)
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
