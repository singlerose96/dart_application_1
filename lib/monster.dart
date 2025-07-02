import 'entity.dart';

class Monster extends Entity {
  Monster({
    required super.name,
    required super.hp,
    required super.attackPower,
  }) : super(defense: 0); // 몬스터 방어력 0

  @override
  void attack(Entity target) {
    int damage = attackPower - target.defense; //데미지 = 몬스터 공격력 - 캐릭터 방어력
    damage = damage > 0 ? damage : 0; //최소 대미지는 0 이상
    target.hp -= damage; //데미지 누적
    print('$name이(가) ${target.runtimeType}을(를) $damage만큼 공격!');
  }
}
