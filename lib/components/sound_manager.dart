import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class SoundManager extends Component {
  late FlameAudio explosionSound;
  late FlameAudio birdLaunchSound;

  @override
  Future<void> onLoad() async {}

  void playExplosion() => FlameAudio.bgm.pause();

  void playLaunch() => FlameAudio.bgm.pause();
}
