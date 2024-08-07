import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homescreen(), 
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Play Button
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), 
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.white,
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
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              backgroundColor: Colors.amber,
              child: const Icon(Icons.circle, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 - 28, 
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              backgroundColor: Colors.amber,
              child: const Icon(Icons.star, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              backgroundColor: Colors.amber,
              child: const Icon(Icons.edit, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
