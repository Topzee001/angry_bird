import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../Authentication/profile.dart';
import 'level_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('birds_intro.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PhysicalModel(
                    color: Colors.transparent,
                    shadowColor: Colors.black,
                    elevation: 8.0,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Angry Birds',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AngryBirds'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    height: 200,
                    child: Image.asset('assets/images/angry_group.png'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LevelScreen()
                            //const GameScreen()
                            ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Text(
                        'Play Now!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AngryBirds',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade900,
                    shape: const CircleBorder()),
                child: const Icon(Icons.settings, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserProfile(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade900,
                    shape: const CircleBorder()),
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
