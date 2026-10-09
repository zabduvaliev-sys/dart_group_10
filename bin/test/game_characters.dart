import 'dart:math';

enum SuperAbility { criticalDamage, boost, heal, blockRevert, gambling }

abstract class GameCharacter {
  int _health;
  int damage;
  String name;

  GameCharacter(this._health, this.damage, this.name);

  int get health => _health;

  set health(int value) {
    if (value < 0) {
      _health = 0;
    } else {
      _health = value;
    }
  }

  bool isAlive() {
    return health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;
  Boss(super.health, super.damage, super.name);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    Random random = Random();
    int randomIndex = random.nextInt(4); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive()) {
        if (h is Berserk && defence != SuperAbility.blockRevert) {
          h.blockedDamage = 10;
          h.health -= (damage - h.blockedDamage);
        } else {
          h.health -= damage;
        }
      }
    }
  }

  @override
  String toString() {
    return '${super.toString()} defence: $defence';
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;
  Hero(super.health, super.damage, super.name, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(int health, int damage, String name)
    : super(health, damage, name, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    Random random = Random();
    int crit = damage * (random.nextInt(5) + 2); // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Magic extends Hero {
  Magic(int health, int damage, String name)
    : super(health, damage, name, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Medic extends Hero {
  int healPoints;
  Medic(int health, int damage, String name, this.healPoints)
    : super(health, damage, name, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive() && h != this) {
        h.health += healPoints;
      }
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(int health, int damage, String name)
    : super(health, damage, name, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    print('Berserk $name reverted $blockedDamage');
    boss.health -= blockedDamage;
  }
}
class Ludoman extends Hero {
  final Random random = Random();

  Ludoman(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.gambling);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int dice1 = random.nextInt(6) + 1;
    int dice2 = random.nextInt(6) + 1;

    print('Ludoman $name rolled $dice1 and $dice2');

    if (dice1 == dice2) {
      int result = dice1 * dice2;
      boss.health -= result;

      print('Ludoman $name won! Boss loses $result health.');
    } else {
      List<Hero> teammates = heroes
          .where((hero) => hero != this && hero.isAlive())
          .toList();

      if (teammates.isEmpty) {
        print('No living teammates to hurt.');
        return;
      }

      Hero teammate = teammates[random.nextInt(teammates.length)];
      int result = dice1 + dice2;

      teammate.health -= result;

      print(
        'Ludoman $name lost! ${teammate.name} loses $result health.',
      );
    }
  }
}