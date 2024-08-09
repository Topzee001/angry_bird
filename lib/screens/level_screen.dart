import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'game_screen.dart';
import 'home_screen.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    !FlameAudio.bgm.isPlaying ? FlameAudio.bgm.resume() : null;

    final List<String> birds = [
      'assets/images/angry_bird.png',
      'assets/images/blackAng_bird.png',
      'assets/images/yellow_bird.png',
      'assets/images/blueAng_bird.png',
    ];

    final List<String> backgrounds = [
      'assets/images/background.png',
      'assets/images/bgdbird1.jpg',
      'assets/images/home_background.png',
      'assets/images/background.webp',
    ];
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/angry-birds-bgd.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.8),
              itemCount: birds.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(
                          screen: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 318,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(backgrounds[index]),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red, width: 3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          birds[index],
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Level ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AngryBirds',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            backgroundColor: Colors.amber.shade900,
            child: const Icon(Icons.home, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      ),
    );
  }
}
