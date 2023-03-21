import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : ElevatedButton(
      onPressed: () {
        setState(() {
          _isLoading = true;
        });
        // Call your login API here and navigate to the next page when done
        _login().then((_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }).catchError((error) {
          // Handle login error here
          setState(() {
            _isLoading = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Error'),
                content: Text(error.toString()),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        });
      },
      child: Text('Login'),
    );
  }

  Future<void> _login() async {
    // Simulate a login request delay
    await Future.delayed(Duration(seconds: 2));
    // Call your login API here
  }
}