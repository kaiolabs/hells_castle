// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:hells_castle/main.dart';
import 'package:hells_castle/personagens/player/hero.dart';

class DoorKey extends GameDecoration with Sensor {
  DoorKey(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('items/key_silver.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  @override
  void onContact(GameComponent collision) {
    if (collision is GameHero) {
      collision.containKey = true;
      removeFromParent();
    }
  }
}
