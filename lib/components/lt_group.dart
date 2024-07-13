import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:liongame/game/assets.dart';
import 'package:liongame/game/configuration.dart';
import 'package:liongame/game/lotus_lion_game.dart';
import 'package:liongame/game/lt_position.dart';
import 'package:liongame/components/lt.dart';

class LtGroup extends PositionComponent with HasGameRef<LotusLionGame> {
  LtGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 200 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      LotusTower(ltPosition: LtPosition.top, height: centerY - spacing / 2),
      LotusTower(
        ltPosition: LtPosition.bottom, 
        height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -40) {
      removeFromParent();
      updateScore();
      
    }
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.lion.score += 1;
  }
}