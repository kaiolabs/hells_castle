// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/functions.dart';
import '../../utils/game_sprite_sheet.dart';

import '../../utils/pontuacao.dart';
import 'enemies_sprite_sheet.dart';

class Imp extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 10;
  static const double _life = 80;
  Imp(this.initPosition)
      : super(
          animation: EnemiesSpriteSheet.impAnimations(),
          position: initPosition,
          size: Vector2.all(tileSize * 0.8),
          speed: tileSize / 0.35,
          life: _life,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              valueByTileSize(6),
              valueByTileSize(6),
            ),
            align: Vector2(
              valueByTileSize(3),
              valueByTileSize(5),
            ),
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
    seeAndMoveToPlayer(
      radiusVision: tileSize * 5,
      closePlayer: (player) {
        execAttack();
      },
    );
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack,
      interval: 350,
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
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: position,
        size: Vector2(32, 32),
      ),
    );
    Pontuacao.pontos += 10;
    removeFromParent();
    super.die();
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
}
