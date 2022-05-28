import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picker_game/src/game_elements/items.dart';
import 'package:picker_game/src/screens/game_over.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    changePackagePos();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }

  Random random = Random();
  bool isCorrect = false;
  int points = 0;

  double packageXPos = -1.0;
  final List<Item> packages = [
    Item(Items.spielZeug, "images/toy.png"),
    Item(Items.nahrung, "images/drink.png"),
    Item(Items.kleidung, "images/sock.png")
  ];

  Item currPackage = Item(Items.spielZeug, "images/toy.png");

  void newPackage() {
    currPackage = packages[random.nextInt(4)];
    if (!isCorrect) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameOver(score: points),
          ));
    }
    isCorrect = false;
    points += 1;
    packageXPos = -1.5;
  }

  void changePackagePos() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (packageXPos > 1.5) newPackage();
      setState(() {
        packageXPos += 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              child: Center(
                child: Image.asset(
                  currPackage.location,
                ),
              ),
            ),
          ),
          Expanded(
            child: DragTarget<Items>(
              builder: ((context, candidateData, rejectedData) {
                return AnimatedContainer(
                  alignment: Alignment(packageXPos, 0.0),
                  duration: const Duration(milliseconds: 100),
                  color: Colors.grey,
                  child: Image.asset("images/box.png"),
                );
              }),
              onWillAccept: (data) => data == currPackage.category,
              onAccept: (_) => isCorrect = true,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Item(Items.spielZeug, "images/toy.png"),
                  Item(Items.nahrung, "images/drink.png"),
                  Item(Items.kleidung, "images/sock.png")
                ]
                    .map(
                      (e) => Draggable<Items>(
                        data: e.category,
                        feedback: Image.asset(e.location),
                        childWhenDragging: Image.asset(e.location),
                        child: Image.asset(e.location),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
