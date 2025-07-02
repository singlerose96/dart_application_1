abstract class Entity {
  String name;
  int hp;
  int attackPower;
  int defense;

  Entity({
    required this.name,
    required this.hp,
    required this.attackPower,
    required this.defense,
  });

  void attack(Entity target); // 공격 
}
