import 'package:flame/components.dart';

import 'buttons.dart';

class PauseMenu extends PositionComponent with HasGameRef {
  final Vector2 centerPosition;
  final void Function() restartPressed;
  final void Function() resumePressed;
  final void Function() exitPressed;

  final Sprite restartSprite;
  final Sprite resumeSprite;
  final Sprite exitSprite;

  PauseMenu({
    required this.restartSprite,
    required this.resumeSprite,
    required this.exitSprite,
    required this.resumePressed,
    required this.centerPosition,
    required this.restartPressed,
    required this.exitPressed,
  }) : super(
            size: Vector2(200, 300),
            anchor: Anchor.center,
            position: centerPosition,
            children: []);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      PlayButton(
        position: Vector2(-160, 0),
        onPressed: () {
          resumePressed();

          removeSelf();
        },
        sprite: resumeSprite,
      ),
    );
    add(
      RestartButton(
        position: Vector2(0, 0),
        onPressed: () {
          restartPressed();

          removeSelf();
        },
        sprite: restartSprite,
      ),
    );

    add(
      ExitButton(
        position: Vector2(160, 0),
        onPressed: () {
          exitPressed();

          removeSelf();
        },
        sprite: exitSprite,
      ),
    );
  }

  void removeSelf() {
    // pauseButton.onPressed = () {
      gameRef.pauseEngine();
      // showPauseMenu();
    // };
    removeFromParent();
  }
}

//
