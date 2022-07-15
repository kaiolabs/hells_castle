// ignore_for_file: avoid_renaming_method_parameters, prefer_final_fields

import 'package:bonfire/bonfire.dart';
import 'package:hells_castle/main.dart';

class PotionLife extends GameDecoration with Sensor {
  Vector2 initPosition;
  double life;

  PotionLife(this.initPosition, this.life)
      : super.withSprite(
          sprite: Sprite.load('items/potion_red.png'),
          position: initPosition,
          size: Vector2(tileSize, tileSize),
        );

  void _starTimeAddLife() {
    gameRef.player?.addLife(100);
  }

  @override
  void onContact(GameComponent collision) {
    if (collision is Player) {
      _starTimeAddLife();
      removeFromParent();
    }
  }
}
