import 'dart:io';

import 'character.dart'; // Character 클래스가 있는 파일

Future<Character> createCharacterFromFile() async {
  final file = File('assets/character.txt');
  final contents = await file.readAsString();

  // '50,10,5' → [50, 10, 5]
  List<String> parts = contents.trim().split(',');
  int hp = int.parse(parts[0]);
  int attack = int.parse(parts[1]);
  int defense = int.parse(parts[2]);

  // 사용자에게 이름 입력받기
  stdout.write("캐릭터 이름을 입력하세요: ");
  String name = stdin.readLineSync() ?? "Hero";

  return Character(
    name: name,
    hp: hp,
    attackPower: attack,
    defense: defense,
  );
}
