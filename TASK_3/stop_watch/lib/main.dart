import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch/watch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WaitScreen(),
      routes: {
        '/watch': (context) => WatchScreen(),
      },
    );
  }
}

class WaitScreen extends StatefulWidget {
  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamed(context, '/watch');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'logo',
        child: Center(
          child: Image.asset(
            'images/timer.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
