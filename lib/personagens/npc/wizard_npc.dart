import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hells_castle/main.dart';

import '../../utils/custom_sprite_animation_widget.dart';
import '../../utils/functions.dart';
import '../../utils/npc_sprite_sheet.dart';

import '../player/player_sprite_sheet.dart';

class WizardNPC extends GameDecoration with ObjectCollision {
  bool _showConversation = false;
  WizardNPC(
    Vector2 position,
  ) : super.withAnimation(
          animation: NpcSpriteSheet.wizardIdleLeft(),
          position: position,
          size: Vector2(tileSize * 0.8, tileSize),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(valueByTileSize(9), valueByTileSize(8)),
            align: Vector2(
              valueByTileSize(2),
              valueByTileSize(8),
            ),
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
          if (!_showConversation) {
            gameRef.player!.idle();
            _showConversation = true;
            _showIntroduction();
          }
        },
        radiusVision: (1.5 * tileSize),
      );
    }
  }

  void _showIntroduction() {
    // Sounds.interaction();
    TalkDialog.show(gameRef.context, [
      Say(
        text: [const TextSpan(text: 'Onde C&%\$@# eu estou? Um castelo?!')],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(text: 'Olá jovem cavaleiro.'),
        ],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Cavaleiro? Você é um mago? Onde estou? Que lugar é esse?')
        ],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Sou um mago mas não sei por qual razão está aqui.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Cuidado com este mundo jovem cavaleiro. Aqui está rodeado de perigos. Tome cuidado!')
        ],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(text: 'Eu não consigo entender o que está acontecendo')
        ],
        person: CustomSpriteAnimationWidget(
          animation: PlayerSpriteSheet.idleRight(),
        ),
        personSayDirection: PersonSayDirection.LEFT,
      ),
      Say(
        text: [const TextSpan(text: 'Você não é daqui, não é mesmo?')],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  "Esse é o Hell's Castle, se a esse mundo você não pertence, busque a sala onde o sol morre.")
        ],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  'Cuidado com as forças do mal que assombram esse lugar, aqui já foi o castelo mais belo do reino, agora está rodeado de perigos e mistérios.')
        ],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [const TextSpan(text: 'Boa sorte cavaleiro!')],
        person: CustomSpriteAnimationWidget(
          animation: NpcSpriteSheet.wizardIdleLeft(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
    ], onChangeTalk: (index) {
      // Sounds.interaction();
    }, onFinish: () {
      // Sounds.interaction();
    });
  }
}
