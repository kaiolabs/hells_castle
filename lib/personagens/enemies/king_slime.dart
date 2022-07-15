// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hells_castle/main.dart';

import '../../utils/game_sprite_sheet.dart';
import '../../utils/functions.dart';

import '../../utils/pontuacao.dart';
import 'enemies_sprite_sheet.dart';

class KingSlime extends SimpleEnemy with ObjectCollision {
  double attack = 25;
  static const double _life = 500;
  KingSlime(Vector2 position)
      : super(
          speed: tileSize / 0.75,
          life: _life,
          size: Vector2.all(tileSize * 1.8),
          position: position,
          animation: EnemiesSpriteSheet.slimeAnimations(),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              valueByTileSize(22),
              valueByTileSize(20),
            ),
            align: Vector2(valueByTileSize(3), valueByTileSize(7)),
          ),
        ],
      ),
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
    Pontuacao.pontos += 250;
    removeFromParent();
    super.die();
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        _executeAttack();
      },
      radiusVision: tileSize * 6,
    );
    super.update(dt);
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

  void _executeAttack() {
    simpleAttackMelee(
        damage: attack,
        size: Vector2.all(tileSize * 1),
        interval: 800,
        animationDown: EnemiesSpriteSheet.enemyAttackEffectBottom(),
        animationLeft: EnemiesSpriteSheet.enemyAttackEffectLeft(),
        animationRight: EnemiesSpriteSheet.enemyAttackEffectRight(),
        animationUp: EnemiesSpriteSheet.enemyAttackEffectTop(),
        execute: () {
          // Sounds.attackEnemyMelee();
        });
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
