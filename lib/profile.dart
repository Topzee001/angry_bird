import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //icon and player info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO: icons is dird_sharp
                    Icon(Icons.circle, size: 32.0, color: Colors.orange),
                    Text(
                      'Player Info',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                Card(
                  color: Colors.amber,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(''),
                        ),
                        SizedBox(height: 10.0),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: List.generate(
                            4,
                            (index) => ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Icon(Icons.star, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //  with a progress bar
                Text(
                  'Level: 10/20',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.grey[300],
                  color: Colors.orange,
                  minHeight: 8.0,
                ),
                SizedBox(height: 20.0),

                Text(
                  'Expert Level',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),

                Wrap(
                  spacing: 10.0,
                  children: List.generate(
                    3,
                    //number of badges
                    (index) => Icon(Icons.emoji_events,
                        color: Colors.amber, size: 40.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
