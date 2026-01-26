import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task2/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const SplashScreen({super.key,required this.onThemeToggle});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void init(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage(onThemeToggle: widget.onThemeToggle)));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 225, 218, 218),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.jpg',
            height: 400,
            width: 400,
            fit: BoxFit.cover,),
            SizedBox(height: 20,),
            Text('ToDo App',
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 22),)
          ],
        ),
      ),
    );
  }
}