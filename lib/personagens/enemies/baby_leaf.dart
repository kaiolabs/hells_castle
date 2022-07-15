// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hells_castle/utils/game_sprite_sheet.dart';
import 'package:hells_castle/main.dart';
import 'package:hells_castle/utils/pontuacao.dart';

import '../../utils/functions.dart';

import 'enemies_sprite_sheet.dart';

class BabyLeaf extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 15;
  static const double _life = 200;

  BabyLeaf(this.initPosition)
      : super(
          animation: EnemiesSpriteSheet.babyLeafAnimations(),
          position: initPosition,
          size: Vector2.all(tileSize * 0.8),
          speed: tileSize / 0.50,
          life: _life,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              valueByTileSize(7),
              valueByTileSize(12),
            ),
            align: Vector2(valueByTileSize(2), valueByTileSize(1)),
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
      closePlayer: (player) {
        execAttack();
      },
      radiusVision: tileSize * 6,
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
    Pontuacao.pontos += 50;
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
}
