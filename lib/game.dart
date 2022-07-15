// ignore_for_file: unused_field

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hells_castle/main.dart';
import 'package:hells_castle/personagens/enemies/baby_leaf.dart';
import 'package:hells_castle/personagens/enemies/boss.dart';
import 'package:hells_castle/personagens/enemies/goblin.dart';
import 'package:hells_castle/personagens/enemies/imp.dart';
import 'package:hells_castle/personagens/enemies/king_ghost.dart';
import 'package:hells_castle/personagens/enemies/king_leaf.dart';
import 'package:hells_castle/personagens/enemies/king_orc.dart';
import 'package:hells_castle/personagens/enemies/king_wizard.dart';
import 'package:hells_castle/personagens/enemies/orc1.dart';
import 'package:hells_castle/personagens/enemies/orc2.dart';
import 'package:hells_castle/personagens/enemies/orc3.dart';
import 'package:hells_castle/personagens/enemies/slime.dart';
import 'package:hells_castle/personagens/npc/wizard_npc.dart';
import 'package:hells_castle/utils/dialogs.dart';
import 'package:hells_castle/utils/pontuacao.dart';

import 'decoration/door.dart';
import 'decoration/end.dart';
import 'decoration/key.dart';
import 'decoration/potion_life.dart';
import 'decoration/spikes.dart';
import 'decoration/torch.dart';
import 'interface/knight_interface.dart';
import 'personagens/enemies/king_slime.dart';
import 'personagens/player/hero.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();

  static void stop() {}
}

class _GameState extends State<Game>
    with WidgetsBindingObserver
    implements GameListener {
  bool showGameOver = false;
  bool showCongratulations = false;

  late GameController _controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _controller = GameController()..addListener(this);
    // Sounds.playBackgroundSound();
    // Sounds.initialize();

    super.initState();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //       Sounds.resumeBackgroundSound();
  //       break;
  //     case AppLifecycleState.inactive:
  //       break;
  //     case AppLifecycleState.paused:
  //       Sounds.pauseBackgroundSound();
  //       break;
  //     case AppLifecycleState.detached:
  //       Sounds.stopBackgroundSound();
  //       break;
  //   }
  // }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (BonfireTiledWidget(
      gameController: _controller,
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          acceptedKeys: [
            LogicalKeyboardKey.space,
          ],
        ),
        directional: JoystickDirectional(
          spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
          spriteKnobDirectional: Sprite.load('joystick_knob.png'),
          size: 100,
          isFixed: true,
        ),
        actions: [
          JoystickAction(
            actionId: 'atack',
            sprite: Sprite.load('joystick_atack.png'),
            spritePressed: Sprite.load('joystick_atack_selected.png'),
            size: 80,
            margin: const EdgeInsets.only(bottom: 50, right: 50),
          ),
        ],
      ),
      map: TiledWorldMap(
        'mapa.json',
        objectsBuilder: {
          'kingWizard': ((properties) => KingWizard((properties.position))),
          'slime': ((properties) => Slime(properties.position)),
          'goblin': ((properties) => Goblin(properties.position)),
          'KingSlime': ((properties) => KingSlime(properties.position)),
          'door': (p) => Door(p.position, p.size),
          'torch': (p) => Torch(p.position),
          'potion': (p) => PotionLife(p.position, 75),
          'wizard': (p) => WizardNPC(p.position),
          'spikes': (p) => Spikes(p.position),
          'key': (p) => DoorKey(p.position),
          'orc1': ((properties) => Orc1(properties.position)),
          'orc2': ((properties) => Orc2(properties.position)),
          'orc3': ((properties) => Orc3(properties.position)),
          'kingOrc': ((properties) => KingOrc(properties.position)),
          'kingGhost': ((properties) => KingGhost(properties.position)),
          'babyLeaf': ((properties) => BabyLeaf(properties.position)),
          'kingLeaf': ((properties) => Kingleaf(properties.position)),
          'boss': ((properties) => Boss(properties.position)),
          'imp': ((properties) => Imp(properties.position)),
          'end': ((properties) => End(properties.position)),
        },
      ),
      interface: HeroInterface(),
      lightingColorGame: Colors.black.withOpacity(0.3),
      background: BackgroundColorGame(Colors.grey[900]!),
      progress: Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            "Loading...",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontFamily: 'Normal',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      player: GameHero(Vector2(47 * tileSize, 50 * tileSize)),
      showCollisionArea: false,
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 4,
        sizeMovementWindow: Vector2(5 * tileSize, 5 * tileSize),
      ),
    ));
  }

  void _showDialogGameOver() {
    setState(() {
      showGameOver = true;
    });
    Dialogs.showGameOver(
      context,
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Game()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  void _showDialogWin() {
    setState(() {
      Pontuacao.isWin = false;
      showCongratulations = true;
    });
    Dialogs.showCongratulations(
      context,
    );
  }

  @override
  void changeCountLiveEnemies(int count) {}

  @override
  void updateGame() {
    if (_controller.player != null && _controller.player?.isDead == true) {
      if (!showGameOver) {
        showGameOver = true;
        _showDialogGameOver();
      }
    }
    if (Pontuacao.isWin == true) {
      if (!showCongratulations) {
        showCongratulations = true;
        _showDialogWin();
      }
    }
  }
}
