import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:hells_castle/main.dart';
import 'package:hells_castle/personagens/player/hero.dart';

class Door extends GameDecoration with ObjectCollision {
  bool open = false;
  bool showDialog = false;

  Door(Vector2 position, Vector2 size)
      : super.withSprite(
          sprite: Sprite.load('items/door_closed.png'),
          position: position,
          size: size,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(width, height / 4),
            align: Vector2(0, height * 0.75),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!open) {
            GameHero p = player as GameHero;
            if (p.containKey == true) {
              open = true;
              p.containKey = false;

              Future.delayed(const Duration(milliseconds: 100), () {
                removeFromParent();
              });
            } else {
              if (!showDialog) {
                showDialog = true;
                _showIntroduction();
              }
            }
          }
        },
        notObserved: () {
          showDialog = false;
        },
        radiusVision: (1.2 * tileSize),
      );
    }
  }

  void _showIntroduction() {
    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Você não tem a chave!',
            )
          ],
        )
      ],
    );
  }
}
