import 'package:angry_bird/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angry Bird',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MySplashScreen(),
    );
  }
}



// class Player extends BodyComponent with HasGameRef<Forge2DGame<Forge2DWorld>> , DragCallbacks{
//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//     renderBody = false;
//     add(SpriteComponent()
//       ..sprite = await gameRef.loadSprite('Red.png')
//       ..size = Vector2.all(26)
//       // ..anchor = Anchor.topLeft
//       );
//   }

//   @override
//   Body createBody() {
//     Shape shape = CircleShape()..radius = 3;
//     BodyDef bodyDef = BodyDef(position: Vector2(10, 5), type: BodyType.dynamic);
//     FixtureDef fixtureDef = FixtureDef(shape, friction: 0.3, density: 1);
//     return world.createBody(bodyDef)..createFixture(fixtureDef);
//   }

  
// }

// class Ground extends BodyComponent {
//   final Vector2 gameSize;
//   Ground(this.gameSize) : super(renderBody: false);

//   @override
//   Body createBody() {
//     Shape shape = EdgeShape()
//       ..set(
//           Vector2(0, gameSize.y * .86), Vector2(gameSize.x, gameSize.y * .86));
//     BodyDef bodyDef = BodyDef(userData: this, position: Vector2.zero());
//     final fixtureDef = FixtureDef(shape, friction: 0.3);
//     return world.createBody(bodyDef)..createFixture(fixtureDef);
//   }
// }
