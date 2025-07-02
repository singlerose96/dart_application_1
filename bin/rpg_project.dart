import 'dart:io';
import 'package:dart_application_1/monster.dart';
import 'package:dart_application_1/character.dart';
import 'package:dart_application_1/monster_loader.dart';


void main() async {
  print("🎮 [Dart RPG 게임에 오신 걸 환영합니다!]");
  stdout.write("캐릭터 이름을 입력하세요: ");
  String name = stdin.readLineSync() ?? '플레이어';

  // 캐릭터 생성
  Character player = Character(
    name: name,
    hp: 100,
    attackPower: 20,
    defense: 5,
  );

  // 몬스터 리스트 로드
  List<Monster> monsters = await createMonstersFromFile();
  print("🧟 총 ${monsters.length}마리의 몬스터가 기다리고 있습니다!\n");

  // 전투 루프 (임시 메뉴용)
  for (var monster in monsters) {
    print("⚔️ 새로운 몬스터 등장: ${monster.name} (HP: ${monster.hp})");
    print("전투를 시작합니다...\n");

    while (player.hp > 0 && monster.hp > 0) {
      print("[1] 공격하기  [2] 방어하기");
      stdout.write("행동을 선택하세요: ");
      String? input = stdin.readLineSync();

      if (input == '1') {
        player.attack(monster);
      } else if (input == '2') {
        player.defend();
      } else {
        print("❌ 올바른 선택이 아닙니다.\n");
        continue;
      }

      if (monster.hp > 0) {
        monster.attack(player);
      }

      print("🙍‍♀️ ${player.name} HP: ${player.hp} | 🧟 ${monster.name} HP: ${monster.hp}\n");
    }

    if (player.hp <= 0) {
      print("💀 당신은 쓰러졌습니다. 게임 오버.");
      break;
    } else {
      print("🎉 ${monster.name}을(를) 물리쳤습니다!\n");
    }
  }

  if (player.hp > 0) {
    print("🌟 모든 몬스터를 물리쳤습니다! 게임 클리어!");
  }
}
