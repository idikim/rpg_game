import 'dart:io';
import 'package:rpg_game/class/character.dart';
import 'package:rpg_game/class/game.dart';
import 'package:rpg_game/class/monster.dart';

void main() async {
  // 캐릭터 정보 읽어오기
  List<String> characterData =
      await File('lib/stat/characters.csv').readAsLines();
  List<String> characterStats = characterData[0].split(',');
  Character player = Character('사용자', int.parse(characterStats[0]),
      int.parse(characterStats[1]), int.parse(characterStats[2]));

  // 몬스터 정보 읽어오기
  List<String> monsterData = await File('lib/stat/monsters.csv').readAsLines();
  List<Monster> monsters = monsterData.map((line) {
    List<String> stats = line.split(',');
    return Monster(stats[0], int.parse(stats[1]), int.parse(stats[2]));
  }).toList();

  // 게임 시작
  Game game = Game(player, monsters);
  game.startGame();
}
