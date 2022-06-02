import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class DinoRunComponent extends SpriteAnimationComponent {
  DinoRunComponent()
      : super(
          size: Vector2.all(80),
          anchor: Anchor.center,
        );

  @override
  Future<void>? onLoad() async {
    final dinoAnimation = await Flame.images.load('DinoSprites - vita.png');
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: dinoAnimation,
      columns: 24,
      rows: 1,
    );
    final runAnimation = spriteSheet.createAnimation(
      row: 0,
      from: 4,
      to: 10,
      stepTime: 0.1,
    );
    animation = runAnimation;
  }

  @override
  void onGameResize(Vector2 size) {
    position = size / 2;
    super.onGameResize(size);
  }
}
