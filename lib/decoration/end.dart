// ignore_for_file: avoid_renaming_method_parameters

import 'package:bonfire/bonfire.dart';
import 'package:hells_castle/main.dart';

import 'package:hells_castle/personagens/player/hero.dart';

import '../utils/game_sprite_sheet.dart';
import '../utils/pontuacao.dart';

class End extends GameDecoration with Sensor {
  End(
    Vector2 position,
  ) : super.withAnimation(
          animation: GameSpriteSheet.end(),
          position: position,
          size: Vector2(tileSize, tileSize),
        ) {
    setupSensorArea(
      intervalCheck: 200,
    );
  }

  @override
  void onContact(GameComponent collision) {
    if (collision is GameHero) {
      Pontuacao.isWin = true;
    }
  }

  // o inimigo também pode receber dano

}
