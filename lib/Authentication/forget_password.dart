import 'package:angry_bird/Authentication/login.dart';
import 'package:angry_bird/Authentication/widgets/my_textfield.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../components/utils/my_button.dart';


class MyForgotPassword extends StatefulWidget {
  const MyForgotPassword({super.key});

  @override
  State<MyForgotPassword> createState() => _MyForgotPasswordState();
}

class _MyForgotPasswordState extends State<MyForgotPassword> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Input your account email to Reset account',
      )));
      return;
    }
  }
 @override
  void initState() {
    super.initState();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('birds_intro.mp3');
  }

  @override
  void dispose() {
FlameAudio.bgm.stop();
FlameAudio.bgm.dispose();    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth / 2;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Reset your Angry Bird Account',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AngryBirds'),
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      controller: emailController,
                      labelText: 'Enter your Email Address',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                        width: containerWidth,
                        child: SizedBox(
                          width: containerWidth,
                          child: MyButton(
                              onTap: resetPassword, text: 'Reset Password'),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: containerWidth,
                        child: SizedBox(
                          width: containerWidth,
                          child: MyButton(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              text: 'Login'),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
