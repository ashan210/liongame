import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'package:liongame/game/lion_movement.dart';
import 'package:liongame/game/assets.dart';
import 'package:liongame/game/configuration.dart';
import 'package:liongame/game/lotus_lion_game.dart';
import 'package:flutter/material.dart';

class Lion extends SpriteGroupComponent<LionMovement>
    with HasGameRef<LotusLionGame>, CollisionCallbacks {
  Lion();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final lion = await gameRef.loadSprite(Assets.lion);
    final lionup = await gameRef.loadSprite(Assets.lionup);
    final liondown = await gameRef.loadSprite(Assets.liondown);

    gameRef.lion;

    size = Vector2(80, 60);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = LionMovement.middle;
    sprites = {
      LionMovement.middle: lion,
      LionMovement.up: lionup,
      LionMovement.down: liondown,
    };
  }
    }