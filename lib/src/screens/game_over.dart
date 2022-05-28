import 'package:flutter/material.dart';
import 'package:picker_game/main.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key, required this.score}) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picker Game"),
      ),
      body: Container(
        color: Colors.deepOrange,
        child: Center(
          child: Column(
            children: [
              Text(
                "your Score was $score",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  child: Text("Home"))
            ],
          ),
        ),
      ),
    );
  }
}
