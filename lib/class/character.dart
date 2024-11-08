import 'package:rpg_game/class/monster.dart';

class Character {
  String name;
  int hp;
  int atk;
  int def;

  Character(this.name, this.hp, this.atk, this.def);

  void attackMonster(Monster monster) {
    int damage = atk - monster.def;
    damage = damage > 0 ? damage : 0;
    monster.hp -= damage;
    print('$name가 ${monster.name}에게 $damage의 데미지를 입혔습니다.');
  }

  void defend(int damage) {
    hp += damage;
    print('$name이 방어태세를 취하여 몬스터의 데미지인 $damage만큼 체력을 회복했습니다.');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $atk, 방어력: $def');
  }
}
