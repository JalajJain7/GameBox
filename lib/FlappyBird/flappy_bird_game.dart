// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, prefer_final_fields

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_bird/FlappyBird/background.dart';
import 'package:flappy_bird/FlappyBird/bird.dart';

import 'package:flappy_bird/FlappyBird/ground_group.dart';
import 'package:flappy_bird/FlappyBird/pipe_group.dart';
import 'package:flappy_bird/FlappyBird/screen.dart';
import 'package:flappy_bird/FlappyBird/sky.dart';

class FlappyBirdGame extends FlameGame
    with TapDetector, HasCollisionDetection, HasGameRef<FlappyBirdGame> {
  FlappyBirdGame();

  final speed = 200;
  late final _bird;
  late final _background;
  late final _ground;
  late final _pipes;

  final StreamController<int> _scoreController =
      StreamController<int>.broadcast();
  int _score = 0;

  Stream<int> get scoreStream => _scoreController.stream;

  double _timeSinceLastPipeGroup = 0;
  @override
  Future<void> onLoad() async {
    addAll([
      _background = Background(),
      _bird = Bird(),
      _ground = GroundGroup(),
      _pipes = PipeGroup(),
      Sky(),
    ]);
  }

  @override
  void onTap() {
    super.onTap();
    _bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceLastPipeGroup += dt;
    if (_timeSinceLastPipeGroup > 2) {
      add(PipeGroup());

      i.value++;

      _timeSinceLastPipeGroup = 0;
    }
  }

  void rr() {
    _bird.removeBird();
    _background.removeBackground();
    _ground.removeGround();
    _pipes.removePipe();
    gameRef.resumeEngine();
  }
}
