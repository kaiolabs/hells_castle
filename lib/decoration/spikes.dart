// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:hells_castle/main.dart';

import '../utils/game_sprite_sheet.dart';

class Spikes extends GameDecoration with Sensor {
  final double damage;

  Spikes(Vector2 position, {this.damage = 35})
      : super.withAnimation(
          animation: GameSpriteSheet.spikes(),
          position: position,
          size: Vector2(tileSize, tileSize),
        ) {
    setupSensorArea(
      intervalCheck: 200,
    );
  }

  @override
  void onContact(GameComponent collision) {
    if (collision is Player) {
      if (animation?.currentIndex == (animation?.frames.length ?? 0) - 1 ||
          animation?.currentIndex == (animation?.frames.length ?? 0) - 2) {
        gameRef.player?.receiveDamage(AttackFromEnum.ENEMY, damage, 0);
      }
    } else if (collision is Enemy) {
      if (animation?.currentIndex == (animation?.frames.length ?? 0) - 1 ||
          animation?.currentIndex == (animation?.frames.length ?? 0) - 2) {
        collision.receiveDamage(AttackFromEnum.PLAYER_OR_ALLY, damage, 0);
      }
    }
  }

  // o inimigo também pode receber dano

  @override
  int get priority => LayerPriority.getComponentPriority(1);
}
