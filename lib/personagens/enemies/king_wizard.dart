// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/custom_sprite_animation_widget.dart';
import '../../utils/functions.dart';
import '../../utils/game_sprite_sheet.dart';
import '../../utils/pontuacao.dart';
import '../player/hero.dart';
import '../player/player_sprite_sheet.dart';
import 'enemies_sprite_sheet.dart';

class KingWizard extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 15;
  bool _seePlayerClose = false;
  bool firstSeePlayer = false;
  static const double _life = 700;

  KingWizard(this.initPosition)
      : super(
          animation: EnemiesSpriteSheet.kingwizardAnimations(),
          position: initPosition,
          size: Vector2(16, 16),
          speed: tileSize / 0.40,
          life: _life,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(valueByTileSize(12), valueByTileSize(14)),
            align: Vector2(valueByTileSize(2), valueByTileSize(3)),
          ),
        ],
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    if (life < _life) {
      drawDefaultLifeBar(
        canvas,
        height: 1,
        margin: 0,
        borderWidth: 1,
      );
    }
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!firstSeePlayer) {
      seePlayer(
        observed: (p) {
          firstSeePlayer = true;
          gameRef.camera.moveToTargetAnimated(
            this,
            zoom: 4,
            finish: () {
              _showConversation();
            },
          );
        },
        radiusVision: tileSize * 5,
      );
    }
    _seePlayerClose = false;
    seePlayer(
      observed: (player) {
        _seePlayerClose = true;
        seeAndMoveToPlayer(
          closePlayer: (player) {
            execAttack();
          },
          radiusVision: tileSize * 2,
        );
      },
      radiusVision: 3,
    );
    if (!_seePlayerClose) {
      seeAndMoveToAttackRange(
        positioned: (p) {
          execAttackRange();
        },
        radiusVision: tileSize * 3,
      );
    }
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: position,
        size: Vector2(32, 32),
      ),
    );
    Pontuacao.pontos += 280;
    (gameRef.player as GameHero).containKey = true;
    removeFromParent();
    super.die();
  }

  void execAttackRange() {
    simpleAttackRange(
      animationRight: GameSpriteSheet.fireBallAttackRight(),
      animationLeft: GameSpriteSheet.fireBallAttackLeft(),
      animationUp: GameSpriteSheet.fireBallAttackTop(),
      animationDown: GameSpriteSheet.fireBallAttackBottom(),
      animationDestroy: GameSpriteSheet.fireBallExplosion(),
      size: Vector2.all(tileSize * 0.65),
      damage: attack,
      speed: speed * (tileSize / 6),
      execute: () {
        // Sounds.attackRange();
      },
      onDestroy: () {
        // Sounds.explosion();
      },
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize / 2, tileSize / 2),
          ),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: tileSize * 0.9,
        blurBorder: tileSize / 2,
        color: Colors.deepOrangeAccent.withOpacity(0.4),
      ),
    );
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack / 3,
      interval: 500,
      animationDown: EnemiesSpriteSheet.enemyAttackEffectBottom(),
      animationLeft: EnemiesSpriteSheet.enemyAttackEffectLeft(),
      animationRight: EnemiesSpriteSheet.enemyAttackEffectRight(),
      animationUp: EnemiesSpriteSheet.enemyAttackEffectTop(),
      execute: () {
        // Sounds.attackEnemyMelee();
      },
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic id) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: valueByTileSize(5),
        color: Colors.white,
        fontFamily: 'Normal',
      ),
    );
    super.receiveDamage(attacker, damage, id);
  }

  void _showConversation() {
    // Sounds.interaction();
    TalkDialog.show(gameRef.context, [
      Say(
        text: [
          const TextSpan(text: 'Olha só o que temos aqui!'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingwizardIdleRight(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [const TextSpan(text: 'Outro mago?')],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Vejo que conheceu meu irmão. Dificil de acreditar não é?'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingwizardIdleRight(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Então você sabe onde fica a sala onde o sol morre?')
        ],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Está procurando pelo portal? Você acredita que pode sair desse castelo? Ah jovem você vai cair também, como nós todos caímos!'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingwizardIdleRight(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [const TextSpan(text: 'Não conte com isso tão rápido.')],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
    ], onFinish: () {
      // Sounds.interaction();
      Future.delayed(const Duration(milliseconds: 500), () {
        gameRef.camera.moveToPlayerAnimated();
        // Sounds.playBackgroundBoosSound();
      });
    }, onChangeTalk: (index) {
      // Sounds.interaction();
    });
  }
}
