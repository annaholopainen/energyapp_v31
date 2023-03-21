import 'package:flutter/material.dart';

Color MyColor = Color(0xFFa3d0e8);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'Didact Gothic',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        color: Color(0xFF04669b).withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Didact Gothic'
                      ),
                      decoration: InputDecoration.collapsed(
                      hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        color: Color(0xFF04669b).withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(
                          fontFamily: 'Didact Gothic'
                      ),
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FloatingActionButton.extended(
                    onPressed:(){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    backgroundColor: Color(0xFF04669b).withOpacity(0.55),
                    label: const Text(
                        style: TextStyle(
                          fontFamily: 'Didact Gothic'
                        ),
                        'Log in'
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}

