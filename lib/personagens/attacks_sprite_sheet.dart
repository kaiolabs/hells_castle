import 'package:bonfire/bonfire.dart';

class AttacksSpriteSheet {
  static const double speedAttack = 0.06;

  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
      'attacks/slash_effect_left.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: speedAttack,
        textureSize: Vector2(16, 16),
      ));

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
      'attacks/slash_effect_right.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: speedAttack,
        textureSize: Vector2(16, 16),
      ));

  static Future<SpriteAnimation> get attackUp => SpriteAnimation.load(
      'attacks/slash_effect_up.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: speedAttack,
        textureSize: Vector2(16, 16),
      ));

  static Future<SpriteAnimation> get attackDown => SpriteAnimation.load(
      'attacks/slash_effect_down.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: speedAttack,
        textureSize: Vector2(16, 16),
      ));
}
