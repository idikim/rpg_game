import 'dart:math';
import 'package:rpg_game/class/character.dart';

class Monster {
  String name;
  int hp;
  int? atk;
  int def = 0; // 몬스터의 방어력은 0으로 고정

  Monster(this.name, this.hp, int maxAtk) {
    atk = Random().nextInt(maxAtk) + 1; // 최소 1 이상의 공격력
    atk = atk! > def ? atk : def; // 캐릭터의 방어력보다 작을 수 없음
  }

  void attackCharacter(Character character) {
    int damage = atk! - character.def;
    damage = damage > 0 ? damage : 0;
    character.hp -= damage;
    print('$name이 ${character.name}에게 $damage의 데미지를 입혔습니다.');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $atk');
  }
}
