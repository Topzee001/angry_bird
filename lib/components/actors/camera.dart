import 'package:angry_bird/components/actors/bird.dart';
import 'package:flame/camera.dart';

class AngryBirdsCamera extends CameraComponent {
  Bird? followingBird;

  void followBird(Bird bird) {
    followingBird = bird;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (followingBird != null) {
      viewport.position = followingBird!.position - viewport.size / 2;
    }
  }
}
