import 'package:flame/components.dart';
import 'package:flame_kenney_xml/flame_kenney_xml.dart';

import '../components/brick.dart';

class Wood extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;

  Wood(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.wood,
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
        );
}

class Metal extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;

  Metal(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.metal,
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
        );
}

class Stone extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;

  Stone(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.stone,
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
        );
}

class Explosives extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;

  Explosives(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.explosive,
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
        );
}

class Glass extends Brick {
  final BrickSize brickSize;
  final Vector2 brickPosition;
  final XmlSpriteSheet sheet;
  final BrickType brickType;

  Glass(
    this.sheet, {
    required this.brickPosition,
    this.brickSize = BrickSize.size140x140,
    this.brickType = BrickType.glass,
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
        );
}
