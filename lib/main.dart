import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatefulWidget {
  DiceApp({Key key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int nextDiceImage = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice App",
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Dice App",
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
          ),
          backgroundColor: Colors.redAccent,
          shadowColor: Colors.redAccent[200],
          elevation: 12.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 90.0,
            ),
            Text(
              "The number is $nextDiceImage",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    child:
                        Image.asset("assets/images/dice_$nextDiceImage.png")),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            RaisedButton(
              color: Colors.redAccent[200],
              onPressed: () {
                final player = AudioCache();
                player.play("/audios/dice_roll_audio.mp3");
                setState(() {
                  nextDiceImage = (Random().nextInt(6) + 1);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Roll the dice",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              elevation: 12.0,
            ),
            SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
