import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height: 45, width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // margin: const EdgeInsets.symmetric(horizontal: 270),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
            border: Border.all(color: Colors.yellow, width: 3),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ]),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'AngryBirds',
                shadows: [
                  Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0))
                ]),
          ),
        ),
      ),
    );
  }
}
