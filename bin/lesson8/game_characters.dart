import 'dart:math';
import 'rpg_game.dart';

enum SuperAbility { criticalDamage, boost, heal, blockRevert }

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
  bool isStunned = false;
  Boss(super.health, super.damage, super.name);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    Random random = Random();
    int randomIndex = random.nextInt(4); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
     Golem? golem;

  for (Hero h in heroes) {
    
    if (h is Golem && h.isAlive()) {
      golem = h;
      break;
    }
  }

  for (Hero h in heroes) {
    if (h.isAlive()) {
       if (h is Lucky) {
      if (RpgGame.random.nextInt(100) < 25) {
        print('Lucky ${h.name} dodged the attack!');
        continue;
      }
    }
      if (h is Golem) {
        h.health -= damage;
      } else {
        int damageToGolem = damage ~/ 5;

        if (golem != null && golem.isAlive()) {
          golem.health -= damageToGolem;
          h.health -= (damage - damageToGolem);
        } else {
          h.health -= damage;
        }
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
  void applySuperPower(Boss boss, List<Hero> heroes) {
      if (RpgGame.roundNumber <= 4) {
    for (Hero h in heroes) {
      if (h.isAlive()) {
        h.damage += 10;
      }
    }

    print('Magic $name boosted all living heroes by 10 damage');
  }

  }
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
class Golem extends Hero {
  Golem(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}
class Lucky extends Hero {
  Lucky(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}
class Witcher extends Hero {
  bool hasResurrected = false;

  Witcher(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.heal);

  @override
  void attack(Boss boss) {
    // Witcher не наносит урон боссу
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (isAlive() && !hasResurrected) {
      for (Hero hero in heroes) {
        if (!hero.isAlive()) {
          hero.health = health;
          health = 0;
          hasResurrected = true;

          print(
            'Witcher $name sacrificed himself to resurrect ${hero.name}',
          );
          break;
        }
      }
    }
  }
}
class Thor extends Hero {
  Thor(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}