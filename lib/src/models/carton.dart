import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rive/rive.dart';

class Carton extends StatefulWidget {
  Carton({Key? key, this.xPos = -1.2}) : super(key: key);

  double xPos;

  @override
  State<Carton> createState() => _CartonState();
}

class _CartonState extends State<Carton> {
  late RiveAnimationController _controller;
  void _onRiveInit(Artboard artboard) {}
  bool _isPlaying = false;

  void play() => _controller.isActive = true;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Reverse',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => play(),
        child: RiveAnimation.asset(
          "images/rive/open_package.riv",
          fit: BoxFit.cover,
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
