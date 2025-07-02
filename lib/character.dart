import 'entity.dart';

class Character extends Entity {
  Character({
    required super.name,
    required super.hp,
    required super.attackPower,
    required super.defense,
  });

  @override
  void attack(Entity target) {
    int damage = attackPower - target.defense;
    damage = damage > 0 ? damage : 0;
    target.hp -= damage;
    print('$name이(가) ${target.runtimeType}을(를) $damage만큼 공격!');
  }
}
