import 'package:flame/components.dart';
import 'package:flame_kenney_xml/flame_kenney_xml.dart';

import '../components/word/brick.dart';

class Wood extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;
  void Function(int? points)? onHit;

  Wood(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.wood,
    required this.onHit,
  }) : super(
          type: brickType,
          size: brickSize,
          damage: BrickDamage.none,
          position: brickPosition,
          sprites: brickFileNames(brickType, brickSize).map(
            (key, filename) => MapEntry(
              key,
              sheet.getSprite(filename),
            ),
          ),
          onContactCallback: onHit,
        );
}

class Metal extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;
  void Function(int? points)? onHit;

  Metal(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.metal,
    required this.onHit,
  }) : super(
          type: brickType,
          size: brickSize,
          damage: BrickDamage.none,
          position: brickPosition,
          sprites: brickFileNames(brickType, brickSize).map(
            (key, filename) => MapEntry(
              key,
              sheet.getSprite(filename),
            ),
          ),
          onContactCallback: onHit,
        );
}

class Stone extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;
  void Function(int? points)? onHit;

  Stone(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.stone,
    required this.onHit,
  }) : super(
          type: brickType,
          size: brickSize,
          damage: BrickDamage.none,
          position: brickPosition,
          sprites: brickFileNames(brickType, brickSize).map(
            (key, filename) => MapEntry(
              key,
              sheet.getSprite(filename),
            ),
          ),
          onContactCallback: onHit,
        );
}

class Explosives extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;
  void Function(int? points)? onHit;

  Explosives(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.explosive,
    required this.onHit,
  }) : super(
          type: brickType,
          size: brickSize,
          damage: BrickDamage.none,
          position: brickPosition,
          sprites: brickFileNames(brickType, brickSize).map(
            (key, filename) => MapEntry(
              key,
              sheet.getSprite(filename),
            ),
          ),
          onContactCallback: onHit,
        );
}

class Glass extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;
  void Function(int? points)? onHit;

  Glass(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.glass,
    required this.onHit,
  }) : super(
          type: brickType,
          size: brickSize,
          damage: BrickDamage.none,
          position: brickPosition,
          sprites: brickFileNames(brickType, brickSize).map(
            (key, filename) => MapEntry(
              key,
              sheet.getSprite(filename),
            ),
          ),
          onContactCallback: onHit,
        );
}
