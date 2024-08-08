// import 'package:angry_bird/components/actors/bird.dart';
// import 'package:flame/components.dart';
// import 'package:flame_audio/flame_audio.dart';
// import 'package:flame_forge2d/flame_forge2d.dart';
// import 'body_component_with_user_data.dart';
//
// const enemySize = 5.0;
//
// class Enemy extends BodyComponentWithUserData with ContactCallbacks {
//   late final AudioPool destroyedSfx;
//
//   void Function(int score)? onContactCallBack;
//
//   Enemy(
//       {required Vector2 position,
//       required Sprite sprite,
//       this.onContactCallBack})
//       : super(
//           renderBody: false,
//           bodyDef: BodyDef()
//             ..position = position
//             ..type = BodyType.dynamic,
//           fixtureDefs: [
//             FixtureDef(
//               PolygonShape()..setAsBoxXY(enemySize / 2, enemySize / 2),
//               friction: 0.3,
//             )
//           ],
//           children: [
//             SpriteComponent(
//               anchor: Anchor.center,
//               sprite: sprite,
//               size: Vector2.all(enemySize),
//               position: Vector2(0, 0),
//             ),
//           ],
//         );
//
//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//     destroyedSfx = await AudioPool.createFromAsset(
//         path: 'audio/sfx/destroyed.mp3', maxPlayers: 1);
//   }
//
//   @override
//   void beginContact(Object other, Contact contact) {
// <<<<<<<< HEAD:lib/components/word/enemy.dart
//     int interceptVelocity =
//         (contact.bodyA.linearVelocity - contact.bodyB.linearVelocity)
//             .length
//             .abs()
//             .toInt();
//     if (other is Bird) {
//       destroyedSfx.start();
//       if (interceptVelocity > 35) {
// ========
//     if (other is Bird) {
//       int interceptVelocity =
//           (contact.bodyA.linearVelocity - contact.bodyB.linearVelocity)
//               .length
//               .abs()
//               .toInt();
//       if (interceptVelocity > 20) {
//         onContactCallBack!(15000);
// >>>>>>>> 07df9ec (add score system & functionality):lib/components/pig.dart
//         removeFromParent();
//       }
//     }
//     super.beginContact(other, contact);
//   }
//
//   @override
//   void update(double dt) {
//     super.update(dt);
//
//     if (position.x > camera.visibleWorldRect.right + 10 ||
//         position.x < camera.visibleWorldRect.left - 10) {
//       removeFromParent();
//     }
//   }
// }
