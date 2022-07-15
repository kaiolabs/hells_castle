// ignore_for_file: avoid_renaming_method_parameters

import 'dart:async';

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
import 'imp.dart';
import 'mini_boss.dart';

class Boss extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 35;
  static const double _life = 6000;
  bool addChild = false;
  bool firstSeePlayer = false;
  List<Enemy> childrenEnemy = [];

  Boss(this.initPosition)
      : super(
          animation: EnemiesSpriteSheet.bossAnimations(),
          position: initPosition,
          size: Vector2(tileSize * 1.5, tileSize * 1.7),
          speed: tileSize / 0.35,
          life: _life,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(valueByTileSize(14), valueByTileSize(16)),
            align: Vector2(valueByTileSize(5), valueByTileSize(11)),
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

    if (life < 1000 && childrenEnemy.isEmpty) {
      addChildInMap(dt);
    }

    if (life < 9000 && childrenEnemy.length == 6) {
      addChildInMap(dt);
    }

    if (life < 2000 && childrenEnemy.length == 8) {
      addChildInMap(dt);
    }

    seeAndMoveToPlayer(
      closePlayer: (player) {
        execAttack();
      },
      radiusVision: tileSize * 3,
    );

    super.update(dt);
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.explosion(),
        position: position,
        size: Vector2(32, 32),
      ),
    );
    for (var e in childrenEnemy) {
      if (!e.isDead) e.die();
    }
    Pontuacao.pontos += 500;
    (gameRef.player as GameHero).containKey = true;
    removeFromParent();
    super.die();
  }

  void addChildInMap(double dt) {
    if (checkInterval('addChild', 5000, dt)) {
      Vector2 positionExplosion = Vector2.zero();

      switch (directionThePlayerIsIn()) {
        case Direction.left:
          positionExplosion = position.translate(width * -2, 0);
          break;
        case Direction.right:
          positionExplosion = position.translate(width * 2, 0);
          break;
        case Direction.up:
          positionExplosion = position.translate(0, height * -2);
          break;
        case Direction.down:
          positionExplosion = position.translate(0, height * 2);
          break;
        case Direction.upLeft:
          break;
        case Direction.upRight:
          break;
        case Direction.downLeft:
          break;
        case Direction.downRight:
          break;
        default:
      }

      Enemy e = childrenEnemy.length == 2
          ? MiniBoss(
              Vector2(
                positionExplosion.x,
                positionExplosion.y,
              ),
            )
          : Imp(
              Vector2(
                positionExplosion.x,
                positionExplosion.y,
              ),
            );

      gameRef.add(
        AnimatedObjectOnce(
          animation: GameSpriteSheet.smokeExplosion(),
          position: positionExplosion,
          size: Vector2(32, 32),
        ),
      );

      childrenEnemy.add(e);
      gameRef.add(e);
    }
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 1),
      damage: attack,
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
          const TextSpan(
              text:
                  'Você conseguiu chegar até aqui então. Foi mais longe do que eu imaginava.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(text: 'Gostou do meu castelo? Belíssimo, não é mesmo?')
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Você pode me explicar o porquê de eu estar aqui?')
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
                  'Eu já fui igual a você, todo perdido, sem saber nada sobre esse mundo.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Você só está me confundindo mais ainda. Pare de enrolar e conte logo!')
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
                  'Não existe um porquê de estar aqui, você apenas está. Frustrante, eu sei.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'As pessoas têm 1% chance de cair aqui. Você só foi o sortudo escolhido pelo acaso.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [const TextSpan(text: 'Há uma maneira de voltar.')],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [const TextSpan(text: 'Uma maneira? Como?')],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Existe um portal. Derrote-me e você voltará. Ou fique e reine comigo.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: EnemiesSpriteSheet.bossIdleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Tentador, mas não. EU PRECISO VOLTAR! Você não vai me fazer mudar de ideia!')
        ],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
    ], onFinish: () {
      // Sounds.interaction();
      addInitChild();
      Future.delayed(const Duration(milliseconds: 500), () {
        gameRef.camera.moveToPlayerAnimated();
        // Sounds.playBackgroundBoosSound();
      });
    }, onChangeTalk: (index) {
      // Sounds.interaction();
    });
  }

  void addInitChild() {
    addImp(position.x - tileSize, position.x - tileSize);
    addImp(position.x - tileSize, position.x); //position.bottom + tileSize);
  }

  void addImp(double x, double y) {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: Vector2(x, y),
        size: Vector2(32, 32),
      ),
    );
    gameRef.add(Imp(
      Vector2(x, y),
    ));
  }
}
