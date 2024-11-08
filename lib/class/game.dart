import 'dart:io';
import 'dart:math';
import 'package:rpg_game/class/character.dart';
import 'package:rpg_game/class/monster.dart';

class Game {
  Character character;
  List<Monster> monsters = [];
  int defeatedMonsterCount = 0;
  int totalMonsterCount = 0;

  Game(this.character, this.monsters) {
    totalMonsterCount = monsters.length;
  }

  void startGame() {
    while (character.hp > 0 && defeatedMonsterCount < totalMonsterCount) {
      Monster monster = getRandomMonster();
      battle(monster);
    }
    if (character.hp <= 0) {
      print('게임 오버!');
    } else {
      print('모든 몬스터를 물리쳤습니다! 승리!');
    }
    saveResult();
  }

  void battle(Monster monster) {
    while (character.hp > 0 && monster.hp > 0) {
      character.showStatus();
      monster.showStatus();
      print('1. 공격하기 2. 방어하기');
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        character.attackMonster(monster);
      } else if (choice == 2) {
        character.defend(monster.atk!);
      }
      if (monster.hp > 0) {
        monster.attackCharacter(character);
      } else {
        defeatedMonsterCount++;
        monsters.remove(monster);
        print('$monster.name을 물리쳤습니다!');
        if (defeatedMonsterCount < totalMonsterCount) {
          print('다음 몬스터와 대결하시겠습니까? (y/n)');
          if (stdin.readLineSync()!.toLowerCase() != 'y') {
            break;
          }
        }
      }
    }
  }

  Monster getRandomMonster() {
    return monsters[Random().nextInt(monsters.length)];
  }

  void saveResult() {
    print('결과를 저장하시겠습니까? (y/n)');
    if (stdin.readLineSync()!.toLowerCase() == 'y') {
      File file = File('result.txt');
      file.writeAsStringSync(
          '${character.name}, ${character.hp}, ${character.hp > 0 ? '승리' : '패배'}');
    }
  }
}
