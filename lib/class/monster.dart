import 'dart:math';
import 'package:rpg_game/class/character.dart';

class Monster {
  String name;
  int hp;
  int atk;
  int def = 0; // 몬스터의 방어력은 0으로 고정

  Monster(this.name, this.hp, this.atk);

  void attackCharacter(Character character) {
    int damage = max(0, atk - character.def);
    character.hp -= damage;
    print('$name이(가) ${character.name}에게 $damage의 데미지를 입혔습니다.');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $atk');
  }
}
