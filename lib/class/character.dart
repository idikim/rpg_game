import 'dart:math';
import 'package:rpg_game/class/monster.dart';

class Character {
  String name;
  int hp;
  int atk;
  int def;

  Character(this.name, this.hp, this.atk, this.def);

  void attackMonster(Monster monster) {
    int damage = max(0, atk - monster.def);
    monster.hp -= damage;
    print('$name가 ${monster.name}에게 $damage의 데미지를 입혔습니다.');
  }

  void defend(int monsterAttack) {
    int damage = monsterAttack - def;
    hp -= damage;
    print('$name이 방어태세를 취하여 $damage만큼만 부상을 입었습니다.');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $atk, 방어력: $def');
  }
}
