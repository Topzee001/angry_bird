import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';


import '../Authentication/login.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
   
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('birds_intro.mp3');
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

@override
  void dispose() {
FlameAudio.bgm.stop();
    FlameAudio.bgm.dispose();    
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
