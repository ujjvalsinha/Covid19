import 'dart:async';

import 'package:covod19/Home.dart';
import 'package:flutter/material.dart';

class SplashScr extends StatefulWidget {
  @override
  _SplashScrState createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  Widget textwrite(txt, ftsize) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: ftsize, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * .19,
          ),
          Container(
            height: size.height * .5,
            width: double.infinity,
            child: Image.asset("images/spl1.png"),
          ),
          SizedBox(
            height: size.height * .14,
          ),
          textwrite("Created by", 16.0),
          textwrite("Ujjval Sinha", 20.0),
        ],
      ),
    );
  }
}
