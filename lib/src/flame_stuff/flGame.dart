import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:picker_game/src/flame_stuff/components/item_sprites.dart';

class MainGame extends FlameGame with SingleGameInstance {
  final ItemSprite sprite = ItemSprite("drink.png");

  @override
  Future<void>? onLoad() {
    //Flame.images.loadAll(["box.png", "drink.png", "sock.png", "toy.png"]);
    add(sprite);
    super.onLoad();
  }
}
