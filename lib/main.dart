import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main(List<String> args) => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playButton(int? note) {
    final player = AudioPlayer();
    player.play(AssetSource('note$note.wav'));
  }

  Expanded buildKey({Color? displayColors, int? soundNumber}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(displayColors),
          ),
          onPressed: () {
            playButton(soundNumber);
          },
          // ignore: prefer_const_constructors
          child: Container(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildKey(displayColors: Colors.red, soundNumber: 1),
             // SizedBox(height: 10,),
              buildKey(displayColors: Colors.yellow, soundNumber: 2),
              buildKey(displayColors: Colors.orange, soundNumber: 3),
              buildKey(displayColors: Colors.green, soundNumber: 4),
              buildKey(displayColors: Colors.teal, soundNumber: 5),
              buildKey(displayColors: Colors.blue, soundNumber: 6),
              buildKey(displayColors: Colors.cyan, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
