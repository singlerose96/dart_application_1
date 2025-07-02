import 'entity.dart';

class Character extends Entity {
  Character({
    required super.name,
    required super.hp,
    required super.attackPower,
    required super.defense,
  });

void defend() {
    print('$name이(가) 방어 자세를 취합니다!');
    // 나중에 데미지 감소 적용 가능
  }

  @override
  void attack(Entity target) {
    int damage = attackPower - target.defense;
    damage = damage > 0 ? damage : 0;
    target.hp -= damage;
    print('$name이(가) ${target.runtimeType}을(를) $damage만큼 공격!');
  }
}
