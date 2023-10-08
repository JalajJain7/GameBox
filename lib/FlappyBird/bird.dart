import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/FlappyBird/flappy_bird_game.dart';
import 'package:flappy_bird/FlappyBird/menu.dart';
import 'package:flappy_bird/FlappyBird/screen.dart';
import 'package:flappy_bird/settings.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

const velocity = 200.0;

class Bird extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('bird.png');
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprite = Sprite(image);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += 1.75 * velocity * dt;
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(duration: 0.2, curve: Curves.decelerate),
      ),
    );
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    gameOver();
  }

  removeBird() {
    removeFromParent();
  }

  gameOver() {
    gameRef.pauseEngine();
    if (vibrateCheck) {
      Vibration.vibrate(duration: 300, amplitude: 10);
    }
    gameOverCheck.value = true;

    // FlappyBirdScreen.showDialogBox();
    scoreSolve();
  }

  void scoreSolve() async {
    var prefs = await SharedPreferences.getInstance();
    if (i.value > highScore) {
      await prefs.setInt('flappyHighScore', i.value);
    }
  }
}
