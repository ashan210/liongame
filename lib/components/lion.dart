import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';

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

    size = Vector2(60, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = LionMovement.middle;
    sprites = {
      LionMovement.middle: lion,
      LionMovement.up: lionup,
      LionMovement.down: liondown,
    };
    add(CircleHitbox());
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = LionMovement.down,
      ),
    );
    current = LionMovement.up;
    FlameAudio.play(Assets.flying);
  }

    @override
    void  onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
    ){
      super.onCollisionStart(intersectionPoints, other);
      gameOver();
    }

    void reset() {
      position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
      score = 0;
    }

    void gameOver() {
      gameRef.overlays.add('gameOver');
      gameRef.pauseEngine();
      game.isHit = true;
    }

    @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.lionVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }
    }