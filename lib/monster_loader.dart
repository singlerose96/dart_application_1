import 'dart:io';
import 'monster.dart';

Future<List<Monster>> createMonstersFromFile() async {
  final file = File('assets/monsters.txt');
  final lines = await file.readAsLines();

  List<Monster> monsters = [];

  for (var line in lines) {
    List<String> parts = line.trim().split(',');
    String name = parts[0];
    int hp = int.parse(parts[1]);
    int attack = int.parse(parts[2]);

    monsters.add(Monster(
      name: name,
      hp: hp,
      attackPower: attack,
    ));
  }

  return monsters;
}
