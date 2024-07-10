import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:liongame/game/assets.dart';
import 'package:liongame/game/lotus_lion_game.dart';

class Background extends SpriteComponent with HasGameRef<LotusLionGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}