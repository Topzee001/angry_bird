import 'package:angry_bird/Authentication/login.dart';
import 'package:angry_bird/Authentication/widgets/my_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/my_button.dart';

import '../screens/game_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Complete the above details to Sign Up',
      )));
      return;
    }
    if (passwordController.text == confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account Successfully created'),
        ),
        // signup function from backend
      );
    } else {
      invalidCredentials('Password does not match');
    }
  }

  void invalidCredentials(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(message),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.8;

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
                      'Create your Angry Bird Account',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AngryBirds'),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: containerWidth,
                      child: MyTextField(
                        controller: emailController,
                        labelText: 'Enter your Email Address',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: containerWidth,
                      child: MyTextField(
                        controller: passwordController,
                        labelText: 'Enter your Password',
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: confirmPasswordController,
                      labelText: 'Confirm your Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: containerWidth,
                        child: MyButton(onTap: signUp, text: 'SIgn Up')),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: containerWidth,
                        child: MyButton(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            text: 'Login')),
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
