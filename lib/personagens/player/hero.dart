// ignore_for_file: avoid_renaming_method_parameters, unused_element

import 'dart:async' as async;

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hells_castle/main.dart';
import 'package:hells_castle/personagens/player/player_sprite_sheet.dart';
import 'package:hells_castle/utils/functions.dart';

class GameHero extends SimplePlayer with Lighting, ObjectCollision {
  double attack = 50;
  double stamina = 200;
  double initSpeed = tileSize / 0.25;
  async.Timer? _timerStamina;
  async.Timer? _timerLife;
  bool containKey = false;
  bool showObserveEnemy = false;

  GameHero(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.playerAnimations(),
          size: Vector2.all(tileSize),
          position: position,
          life: 250,
          speed: tileSize / 0.25,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(valueByTileSize(8), valueByTileSize(8)),
            align: Vector2(
              valueByTileSize(4),
              valueByTileSize(8),
            ),
          ),
        ],
      ),
    );

    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width,
        color: Colors.deepOrangeAccent.withOpacity(0.2),
      ),
    );
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 'atack') {
      actionAttack();
    }
    super.joystickAction(event);
  }

  @override
  void die() {
    removeFromParent();
    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load('player/crypt.png'),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(30),
      ),
    );
    super.die();
  }

  void actionAttack() {
    if (stamina < 10) {
      return;
    }

    decrementStamina(10);
    simpleAttackMelee(
      damage: attack,
      animationDown: PlayerSpriteSheet.attackEffectBottom(),
      animationLeft: PlayerSpriteSheet.attackEffectLeft(),
      animationRight: PlayerSpriteSheet.attackEffectRight(),
      animationUp: PlayerSpriteSheet.attackEffectTop(),
      size: Vector2.all(tileSize),
    );
  }

  @override
  void update(double dt) {
    if (isDead) return;
    _verifyStamina();
    _verifyLife();
    seeEnemy(
      radiusVision: tileSize * 6,
      notObserved: () {
        showObserveEnemy = false;
      },
      observed: (enemies) {
        if (showObserveEnemy) return;
        showObserveEnemy = true;
        _showEmote();
      },
    );
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  void _verifyStamina() {
    if (_timerStamina == null) {
      _timerStamina = async.Timer(const Duration(milliseconds: 35), () {
        _timerStamina = null;
      });
    } else {
      return;
    }

    stamina += 2;
    if (stamina > 100) {
      stamina = 100;
    }
  }

  void _verifyLife() {
    if (_timerLife == null) {
      _timerLife = async.Timer(const Duration(seconds: 10), () {
        _timerLife = null;
      });
    } else {
      return;
    }

    life += 25;
    if (life > 250) {
      life = 250;
    }
  }

  void decrementStamina(int i) {
    stamina -= i;
    if (stamina < 0) {
      stamina = 0;
    }
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic id) {
    if (isDead) return;
    showDamage(
      damage,
      config: TextStyle(
        fontSize: valueByTileSize(5),
        color: Colors.orange,
        fontFamily: 'Normal',
      ),
    );
    super.receiveDamage(attacker, damage, id);
  }

  void _showEmote({String emote = 'emote/emote_exclamacao.png'}) {
    gameRef.add(
      AnimatedFollowerObject(
        animation: SpriteAnimation.load(
          emote,
          SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
          ),
        ),
        target: this,
        size: Vector2(12, 12),
        positionFromTarget: Vector2(2, -12),
      ),
    );
  }
}
