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

class KingGhost extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 35;
  bool firstSeePlayer = false;
  static const double _life = 2700;

  KingGhost(this.initPosition)
      : super(
          animation: EnemiesSpriteSheet.kingGhostAnimations(),
          position: initPosition,
          size: Vector2.all(tileSize * 2),
          speed: tileSize / 0.35,
          life: _life,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              valueByTileSize(20),
              valueByTileSize(22),
            ),
            align: Vector2(valueByTileSize(0), valueByTileSize(8)),
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
    Pontuacao.pontos += 350;
    (gameRef.player as GameHero).containKey = true;
    removeFromParent();
    super.die();
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 1.3),
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
          const TextSpan(text: 'Uma pessoa viva!'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingGhostIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Estou começando a alucinar agora? Ou estou vendo um fantasma?')
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
                  'Sou as almas aprisionadas nesse castelo. E você irá se juntar a elas!'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingGhostIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Almas? Mais pessoas como eu já caíram nesse mundo?')
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
                  'Você está olhando para elas nesse momento e só falta você.'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.kingGhostIdleLeft(),
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
