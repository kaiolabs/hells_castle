// import 'package:flame_audio/flame_audio.dart';
// import 'package:flutter/foundation.dart';

// class Sounds {
//   static Future initialize() async {
//     if (!kIsWeb) {
//       FlameAudio.bgm.initialize();
//       await FlameAudio.audioCache.loadAll([
//         'attack_player.mp3',
//         'attack_fire_ball.wav',
//         'attack_enemy.mp3',
//         'explosion.wav',
//         'sound_interaction.wav',
//       ]);
//     }
//   }

//   static void attackPlayerMelee() {
//     if (kIsWeb) return;
//     FlameAudio.play('attack_player.mp3', volume: 0.4);
//   }

//   static void attackRange() {
//     if (kIsWeb) return;
//     FlameAudio.play('attack_fire_ball.wav', volume: 0.3);
//   }

//   static void attackEnemyMelee() {
//     if (kIsWeb) return;
//     FlameAudio.play('attack_enemy.mp3', volume: 0.4);
//   }

//   static void explosion() {
//     if (kIsWeb) return;
//     FlameAudio.play('explosion.wav');
//   }

//   static void interaction() {
//     if (kIsWeb) return;
//     FlameAudio.play('sound_interaction.wav', volume: 0.4);
//   }

//   static stopBackgroundSound() {
//     if (kIsWeb) return;
//     return FlameAudio.bgm.stop();
//   }

//   static playBackgroundSound() async {
//     if (kIsWeb) return;
//     await FlameAudio.bgm.stop();
//     FlameAudio.bgm.play('sound_bg.mp3');
//   }

//   static void playBackgroundBoosSound() {
//     if (kIsWeb) return;
//     FlameAudio.bgm.play('battle_boss.mp3');
//   }

//   static void pauseBackgroundSound() {
//     if (kIsWeb) return;
//     FlameAudio.bgm.pause();
//   }

//   static void resumeBackgroundSound() {
//     if (kIsWeb) return;
//     FlameAudio.bgm.resume();
//   }

//   static void dispose() {
//     if (kIsWeb) return;
//     FlameAudio.bgm.dispose();
//   }
// }
