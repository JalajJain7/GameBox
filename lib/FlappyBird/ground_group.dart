import 'package:flame/components.dart';
import 'package:flappy_bird/FlappyBird/flappy_bird_game.dart';
import 'package:flappy_bird/FlappyBird/ground.dart';

class GroundGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  GroundGroup();

  @override
  Future<void> onLoad() async {
    addAll([
      Ground(x: gameRef.size.x),
      Ground(x: 0),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // print(children.length);
    if (children.length == 1) {
      addAll([
        Ground(x: gameRef.size.x),
        Ground(x: 0),
      ]);
    }
  }

  removeGround() {
    removeFromParent();
  }
}
