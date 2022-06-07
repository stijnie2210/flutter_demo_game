import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class HealthBarComponent extends PositionComponent {
  final int maxHealth;
  int health = 0;

  late final Sprite sprite;

  HealthBarComponent({required this.maxHealth}) : super(position: Vector2(60, 15)) {
    health = maxHealth;
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('health.png');
  }

  void damage(int damage) {
    health -= damage;
    if (health < 0) {
      health = 0;
    }
  }

  void heal(int heal) {
    health += heal;
    if (health > maxHealth) {
      health = maxHealth;
    }
  }

  void reset() {
    health = maxHealth;
  }

  @override
  void render(Canvas canvas) {
    for (int i = 0; i < health; i++) {
      sprite.render(canvas, size: Vector2.all(20), position: Vector2((i * 20).toDouble(), y));
    }
  }
}
