import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game_demo/config/constants.dart';
import 'package:flutter_game_demo/game.dart';

enum DinoState {
  idle,
  run,
  jumping,
}

class DinoGroupComponent extends SpriteAnimationGroupComponent with HasGameRef<FlutterDemoGame> {
  DinoGroupComponent() : super(size: Vector2.all(80));

  double speedY = 0.0;
  double yMax = 0.0;

  @override
  Future<void>? onLoad() async {
    final dinoAnimationSprite = await Flame.images.load('DinoSprites - vita.png');
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: dinoAnimationSprite,
      columns: 24,
      rows: 1,
    );
    final dinoIdleAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 0,
      to: 3,
    );

    final runAnimation = spriteSheet.createAnimation(
      row: 0,
      from: 4,
      to: 10,
      stepTime: 0.1,
    );

    final jumpAnimation = spriteSheet.createAnimation(
      row: 0,
      from: 18,
      to: 24,
      stepTime: 0.1,
    );
    animations = {
      DinoState.idle: dinoIdleAnimation,
      DinoState.run: runAnimation,
      DinoState.jumping: jumpAnimation,
    };
    current = DinoState.run;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    speedY += gravity * dt;
    y += speedY * dt;

    if (isOnGround) {
      y = yMax;
      speedY = 0;
      current = DinoState.run;
    }
  }

  void run() {
    current = DinoState.run;
  }

  void stop() {
    current = DinoState.idle;
  }

  bool get isOnGround => y >= yMax;

  void jump() {
    if (isOnGround) {
      current = DinoState.jumping;
      speedY = -600;
    }
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    height = width = size.x / numberOfTilesAlongWidth;
    x = width;
    y = size.y - groundHeight - height;
    yMax = y;
  }
}
