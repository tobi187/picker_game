import 'package:flame/components.dart';

class ItemSprite extends SpriteComponent with HasGameRef {
  final String imagePath;
  ItemSprite(this.imagePath) : super(size: Vector2.all(50.0));

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    super.onLoad();
    sprite = await gameRef.loadSprite(imagePath);
    position = gameRef.size / 2;
  }
}
