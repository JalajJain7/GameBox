// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/FlappyBird/flappy_bird_game.dart';

class Sky extends PositionComponent with HasGameRef<FlappyBirdGame> {
  Sky();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('base.png');
    size = Vector2(gameRef.size.x, 110);
    position = Vector2(x, -size.y);
    add(SpriteComponent(
      sprite: Sprite(image),
      size: size,
    ));
    add(RectangleHitbox());
  }
}
