import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../home/home_screen.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomeScreen() : LoginScreen();
  }
}