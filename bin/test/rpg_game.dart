import 'game_characters.dart';

class RpgGame {
  static int roundNumber = 0;
  static void startGame() {
    Boss boss = Boss(1000, 50, 'Dragon');
    Warrior warrior1 = Warrior(280, 10, 'Leon');
    Warrior warrior2 = Warrior(270, 15, 'Ahiles');
    Medic doc = Medic(250, 5, 'Aibolit', 15);
    Medic assistant = Medic(300, 5, 'Max', 5);
    Berserk berserk = Berserk(260, 10, 'Alex');
    Magic magic = Magic(290, 10, 'Strange');
    Ludoman ludoman = Ludoman(260, 8, 'Gambler');

    List<Hero> heroes = [warrior1, doc, berserk, assistant, magic, warrior2, ludoman,];
    printStatistics(boss, heroes);

    while (!isGameOver(boss, heroes)) {
      playRound(boss, heroes);
    }
  }

  static void printStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber ----------------');
    print(boss);
    for (Hero h in heroes) {
      print(h);
    }
  }

  static void playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    boss.attack(heroes);
    for (Hero h in heroes) {
      if (h.isAlive() && boss.isAlive() && h.ability != boss.defence) {
        h.attack(boss);
        h.applySuperPower(boss, heroes);
      }
    }
    printStatistics(boss, heroes);
  }

  static bool isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (Hero h in heroes) {
      if (h.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }
}
