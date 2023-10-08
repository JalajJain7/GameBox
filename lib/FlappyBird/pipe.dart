// ignore_for_file: annotate_overrides

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/FlappyBird/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required this.pipePosition, required this.height});

  final PipePosition pipePosition;
  final double height;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load('pipe.png');
    final pipeRotated = await Flame.images.load('pipe_rotated.png');
    size = Vector2(50, height);
    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - 110;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}

enum PipePosition { top, bottom }
