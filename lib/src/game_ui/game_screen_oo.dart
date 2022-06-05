import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picker_game/src/models/carton.dart';

class GameScreenOO extends StatefulWidget {
  const GameScreenOO({Key? key}) : super(key: key);

  @override
  State<GameScreenOO> createState() => _GameScreenOOState();
}

class _GameScreenOOState extends State<GameScreenOO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Stack(
                children: [Carton(xPos: .5)],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Row(),
            ),
          )
        ],
      ),
    );
  }
}
