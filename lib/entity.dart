abstract class Entity {
  String name;
  int hp;
  int power;
  int defense;

  Entity({
    required this.name,
    required this.hp,
    required this.power,
    required this.defense,
  });

  void attack(Entity target); // 공통 공격 함수 (추상)
}
