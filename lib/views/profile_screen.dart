import 'package:energyapp_v3/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';

import '../models/colors/DarkBlue.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightBlue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/BGShapes.png",
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage(
                        'assets/dummyprofilepic.jpeg'
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontFamily: 'Didact Gothic',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontFamily: 'Didact Gothic',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      backgroundColor: DarkBlue,
                      label: const Text(
                          style: TextStyle(
                              fontFamily: 'Didact Gothic'
                          ),
                          'Sign out'
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}