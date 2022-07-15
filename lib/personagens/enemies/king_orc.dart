// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hells_castle/utils/game_sprite_sheet.dart';
import 'package:hells_castle/main.dart';

import '../../utils/custom_sprite_animation_widget.dart';
import '../../utils/functions.dart';

import '../../utils/pontuacao.dart';
import '../player/hero.dart';
import '../player/player_sprite_sheet.dart';
import 'enemies_sprite_sheet.dart';

class KingOrc extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 25;
  bool firstSeePlayer = false;
  static const double _life = 1500;

  KingOrc(this.initPosition)
      : super(
          animation: EnemiesSpriteSheet.kingOrcAnimations(),
          position: initPosition,
          size: Vector2.all(tileSize * 2),
          speed: tileSize / 0.47,
          life: _life,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              valueByTileSize(22),
              valueByTileSize(22),
            ),
            align: Vector2(valueByTileSize(1), valueByTileSize(4)),
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
            zoom: 5,
            finish: () {
              _showConversation();
            },
          );
        },
        radiusVision: tileSize * 7,
      );
    }
    seeAndMoveToPlayer(
      closePlayer: (player) {
        execAttack();
      },
      radiusVision: tileSize * 5,
    );
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
    Pontuacao.pontos += 320;
    (gameRef.player as GameHero).containKey = true;
    removeFromParent();
    super.die();
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.70),
      damage: attack,
      interval: 800,
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
          const TextSpan(text: 'Vejam só! Um braquelo!'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingOrcIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Olha só, realmente só faltava um orc aparecer mesmo.')
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
                  'Ei! Grandão! Por acaso sabe o que significa a sala onde o sol morre?')
        ],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Todos conhecem a sala mais a oeste do castelo.'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingOrcIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'A sala mais a oeste? É claro! Como eu não pensei nisso antes?!')
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
                  'A sala mais a oeste? É claro! Como eu não pensei nisso antes?!')
        ],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [const TextSpan(text: 'Onde o sol morre! Ele se pôe no oeste!')],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(text: 'Você já está falando de mais, branquelo.'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingOrcIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(text: 'Se prepare para enfrentar o grandioso Umak!'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingOrcIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
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
