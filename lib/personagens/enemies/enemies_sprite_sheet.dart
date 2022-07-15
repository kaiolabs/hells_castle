import 'package:bonfire/bonfire.dart';

class EnemiesSpriteSheet {
  static const double speed = 0.08;
  static const double size = 16;

  static SimpleDirectionAnimation slimeAnimations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/slime/slime_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: speed,
            textureSize: Vector2(size, size),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/slime/slime_idle_right.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: speed,
            textureSize: Vector2(size, size),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/slime/slime_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: speed,
            textureSize: Vector2(size, size),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/slime/slime_run_right.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: speed,
            textureSize: Vector2(size, size),
          ),
        ),
      );

  static Future<SpriteAnimation> enemyAttackEffectBottom() =>
      SpriteAnimation.load(
        'enemies/atack_effect_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> enemyAttackEffectLeft() =>
      SpriteAnimation.load(
        'enemies/atack_effect_left.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> enemyAttackEffectRight() =>
      SpriteAnimation.load(
        'enemies/atack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> enemyAttackEffectTop() => SpriteAnimation.load(
        'enemies/atack_effect_top.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> bossIdleRight() => SpriteAnimation.load(
        'enemies/boss/boss_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 36),
        ),
      );

  static SimpleDirectionAnimation bossAnimations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/boss/boss_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 36),
          ),
        ),
        idleRight: bossIdleRight(),
        runLeft: SpriteAnimation.load(
          'enemies/boss/boss_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 36),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/boss/boss_run_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 36),
          ),
        ),
      );

  static Future<SpriteAnimation> goblinIdleRight() => SpriteAnimation.load(
        'enemies/goblin/goblin_idle.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation goblinAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/goblin/goblin_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/goblin/goblin_idle.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/goblin/goblin_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/goblin/goblin_run_right.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
      );

  static Future<SpriteAnimation> impIdleRight() => SpriteAnimation.load(
        'enemies/imp/imp_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation impAnimations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/imp/imp_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/imp/imp_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/imp/imp_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/imp/imp_run_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
      );

  static Future<SpriteAnimation> miniBossIdleRight() => SpriteAnimation.load(
        'enemies/mini_boss/mini_boss_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 24),
        ),
      );

  static SimpleDirectionAnimation miniBossAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/mini_boss/mini_boss_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/mini_boss/mini_boss_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/mini_boss/mini_boss_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/mini_boss/mini_boss_run_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
      );

  static Future<SpriteAnimation> kingwizardIdleRight() => SpriteAnimation.load(
        'enemies/king_wizard/king_wizard_idle_left.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 24),
        ),
      );

  static SimpleDirectionAnimation kingwizardAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/king_wizard/king_wizard_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15.5, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/king_wizard/king_wizard_idle_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15.5, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/king_wizard/king_wizard_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15.5, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/king_wizard/king_wizard_idle_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15.5, 16),
          ),
        ),
      );

  // ============================================================================================================================

  static SimpleDirectionAnimation orc1Animations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/orc1/orc1_left_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/orc1/orc1_right_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/orc1/orc1_left_run.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/orc1/orc1_right_run.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(14.5, 16),
          ),
        ),
      );

  static SimpleDirectionAnimation orc2Animations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/orc2/orc2_left_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/orc2/orc2_right_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/orc2/orc2_left_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/orc2/orc2_right_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(15, 16),
          ),
        ),
      );

  static SimpleDirectionAnimation orc3Animations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/orc3/orc3_left_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/orc3/orc3_right_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/orc3/orc3_left_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/orc3/orc3_right_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(15, 16),
          ),
        ),
      );

  static Future<SpriteAnimation> kingOrcIdleLeft() => SpriteAnimation.load(
        'enemies/king_orc/king_orc_left_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(30, 30),
        ),
      );

  static SimpleDirectionAnimation kingOrcAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/king_orc/king_orc_left_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/king_orc/king_orc_right_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/king_orc/king_orc_left_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/king_orc/king_orc_right_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
      );

  static Future<SpriteAnimation> kingGhostIdleLeft() => SpriteAnimation.load(
        'enemies/king_ghost/king_ghost_left_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation kingGhostAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/king_ghost/king_ghost_left_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/king_ghost/king_ghost_right_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/king_ghost/king_ghost_left_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/king_ghost/king_ghost_right_run.png',
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.15,
            textureSize: Vector2(16, 16),
          ),
        ),
      );

  static SimpleDirectionAnimation babyLeafAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/baby_leaf/baby_leaf_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15, 15),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/baby_leaf/baby_leaf_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15, 15),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/baby_leaf/baby_leaf_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15, 15),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/baby_leaf/baby_leaf_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(15, 15),
          ),
        ),
      );

  static Future<SpriteAnimation> kingLeafIdleLeft() => SpriteAnimation.load(
        'enemies/king_leaf/king_leaf_left_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(30, 30),
        ),
      );

  static SimpleDirectionAnimation kingLeafAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'enemies/king_leaf/king_leaf_left_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
        idleRight: SpriteAnimation.load(
          'enemies/king_leaf/king_leaf_right_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
        runLeft: SpriteAnimation.load(
          'enemies/king_leaf/king_leaf_left_run.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
        runRight: SpriteAnimation.load(
          'enemies/king_leaf/king_leaf_right_run.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(31, 36),
          ),
        ),
      );
}
