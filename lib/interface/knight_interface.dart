// ignore_for_file: avoid_renaming_method_parameters, prefer_const_constructors, empty_catches

import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hells_castle/personagens/player/hero.dart';

import 'bar_life_component.dart';

class HeroInterface extends GameInterface {
  late Sprite key;

  @override
  Future<void> onLoad() async {
    key = await Sprite.load('items/key_silver.png');
    add(BarLifeComponent());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      _drawKey(canvas);
    } catch (e) {}
    super.render(canvas);
  }

  void _drawKey(Canvas c) {
    if (gameRef.player != null && (gameRef.player as GameHero).containKey) {
      key.renderRect(c, Rect.fromLTWH(150, 20, 35, 30));
    }
  }
}
