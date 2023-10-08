// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/FlappyBird/flappy_bird_game.dart';

class Ground extends PositionComponent with HasGameRef<FlappyBirdGame> {
  Ground({required this.x});

  final double x;

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('base.png');
    size = Vector2(gameRef.size.x, 110);
    position = Vector2(x, gameRef.size.y - size.y);
    add(SpriteComponent(
      sprite: Sprite(image),
      size: size,
    ));
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= (gameRef.speed - 10) * dt;
    if (position.x < gameRef.size.x * -1) {
      // print("removed");
      removeFromParent();
    }
  }
}
