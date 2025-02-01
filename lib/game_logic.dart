import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = '';
    if (Player.playerX.containesAll(0, 1, 2) ||
        Player.playerX.containesAll(3, 4, 5) ||
        Player.playerX.containesAll(6, 7, 8) ||
        Player.playerX.containesAll(0, 3, 6) ||
        Player.playerX.containesAll(1, 4, 7) ||
        Player.playerX.containesAll(2, 5, 8) ||
        Player.playerX.containesAll(0, 4, 8) ||
        Player.playerX.containesAll(2, 4, 6)) {
      winner = 'X';
    } else if (Player.playerO.containesAll(0, 1, 2) ||
        Player.playerO.containesAll(3, 4, 5) ||
        Player.playerO.containesAll(6, 7, 8) ||
        Player.playerO.containesAll(0, 3, 6) ||
        Player.playerO.containesAll(1, 4, 7) ||
        Player.playerO.containesAll(2, 5, 8) ||
        Player.playerO.containesAll(0, 4, 8) ||
        Player.playerO.containesAll(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }
    return winner;
  }

  Future<void> autoPlay(activePlayer) async {
    List<int> emptyList = [];
    int index = 0;
    Random random = Random();

    for (int m = 0; m < 9; m++) {
      if (!(Player.playerO.contains(m) || Player.playerX.contains(m))) {
        emptyList.add(m);
      }
    }

    // represent the end && this is casess for defence
    if ((Player.playerX.containesAll(0, 1) && emptyList.contains(2))) {
      index = 2;
    } else if ((Player.playerX.containesAll(3, 4)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerX.containesAll(6, 7)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerX.containesAll(0, 3)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerX.containesAll(1, 4)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerX.containesAll(2, 5)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerX.containesAll(0, 4)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerX.containesAll(2, 4)) && emptyList.contains(6)) {
      index = 6;
    }
    // represent Center
    else if ((Player.playerX.containesAll(0, 2) && emptyList.contains(1))) {
      index = 1;
    } else if ((Player.playerX.containesAll(3, 5)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerX.containesAll(6, 8)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerX.containesAll(0, 6)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerX.containesAll(1, 7)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerX.containesAll(2, 8)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerX.containesAll(0, 8)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerX.containesAll(2, 6)) && emptyList.contains(4)) {
      index = 4;
    }
    // represent start
    else if ((Player.playerX.containesAll(1, 2) && emptyList.contains(0))) {
      index = 0;
    } else if ((Player.playerX.containesAll(4, 5)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerX.containesAll(7, 8)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerX.containesAll(3, 6)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerX.containesAll(4, 7)) && emptyList.contains(1)) {
      index = 1;
    } else if ((Player.playerX.containesAll(5, 8)) && emptyList.contains(2)) {
      index = 2;
    } else if ((Player.playerX.containesAll(4, 8)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerX.containesAll(4, 6)) && emptyList.contains(2)) {
      index = 2;
    }
    // Reverse the last cases
    // represent end
    else if ((Player.playerX.containesAll(1, 0) && emptyList.contains(2))) {
      index = 2;
    } else if ((Player.playerX.containesAll(4, 3)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerX.containesAll(7, 6)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerX.containesAll(3, 0)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerX.containesAll(4, 1)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerX.containesAll(5, 2)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerX.containesAll(4, 0)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerX.containesAll(4, 2)) && emptyList.contains(6)) {
      index = 6;
    }
    // represent Center
    else if ((Player.playerX.containesAll(2, 0) && emptyList.contains(1))) {
      index = 1;
    } else if ((Player.playerX.containesAll(5, 3)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerX.containesAll(8, 6)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerX.containesAll(6, 0)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerX.containesAll(7, 1)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerX.containesAll(8, 2)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerX.containesAll(8, 0)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerX.containesAll(6, 2)) && emptyList.contains(4)) {
      index = 4;
    }
    // represent start
    else if ((Player.playerX.containesAll(2, 1) && emptyList.contains(0))) {
      index = 0;
    } else if ((Player.playerX.containesAll(5, 4)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerX.containesAll(8, 7)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerX.containesAll(6, 3)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerX.containesAll(7, 4)) && emptyList.contains(1)) {
      index = 1;
    } else if ((Player.playerX.containesAll(8, 5)) && emptyList.contains(2)) {
      index = 2;
    } else if ((Player.playerX.containesAll(8, 4)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerX.containesAll(6, 4)) && emptyList.contains(2)) {
      index = 2;
    }
    // this is casess for attace and win
    // represent the end
    else if ((Player.playerO.containesAll(0, 1) && emptyList.contains(2))) {
      index = 2;
    } else if ((Player.playerO.containesAll(3, 4)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerO.containesAll(6, 7)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerO.containesAll(0, 3)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerO.containesAll(1, 4)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerO.containesAll(2, 5)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerO.containesAll(0, 4)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerO.containesAll(2, 4)) && emptyList.contains(6)) {
      index = 6;
    }
    // represent Center
    else if ((Player.playerO.containesAll(0, 2) && emptyList.contains(1))) {
      index = 1;
    } else if ((Player.playerO.containesAll(3, 5)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerO.containesAll(6, 8)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerO.containesAll(0, 6)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerO.containesAll(1, 7)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerO.containesAll(2, 8)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerO.containesAll(0, 8)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerO.containesAll(2, 6)) && emptyList.contains(4)) {
      index = 4;
    }
    // represent start
    else if ((Player.playerO.containesAll(1, 2) && emptyList.contains(0))) {
      index = 0;
    } else if ((Player.playerO.containesAll(4, 5)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerO.containesAll(7, 8)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerO.containesAll(3, 6)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerO.containesAll(4, 7)) && emptyList.contains(1)) {
      index = 1;
    } else if ((Player.playerO.containesAll(5, 8)) && emptyList.contains(2)) {
      index = 2;
    } else if ((Player.playerO.containesAll(4, 8)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerO.containesAll(4, 6)) && emptyList.contains(2)) {
      index = 2;
    }
    // Reverse the last cases
    // represent end
    else if ((Player.playerO.containesAll(1, 0) && emptyList.contains(2))) {
      index = 2;
    } else if ((Player.playerO.containesAll(4, 3)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerO.containesAll(7, 6)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerO.containesAll(3, 0)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerO.containesAll(4, 1)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerO.containesAll(5, 2)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerO.containesAll(4, 0)) && emptyList.contains(8)) {
      index = 8;
    } else if ((Player.playerO.containesAll(4, 2)) && emptyList.contains(6)) {
      index = 6;
    }
    // represent Center
    else if ((Player.playerO.containesAll(2, 0) && emptyList.contains(1))) {
      index = 1;
    } else if ((Player.playerO.containesAll(5, 3)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerO.containesAll(8, 6)) && emptyList.contains(7)) {
      index = 7;
    } else if ((Player.playerO.containesAll(6, 0)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerO.containesAll(7, 1)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerO.containesAll(8, 2)) && emptyList.contains(5)) {
      index = 5;
    } else if ((Player.playerO.containesAll(8, 0)) && emptyList.contains(4)) {
      index = 4;
    } else if ((Player.playerO.containesAll(6, 2)) && emptyList.contains(4)) {
      index = 4;
    }
    // represent start
    else if ((Player.playerO.containesAll(2, 1) && emptyList.contains(0))) {
      index = 0;
    } else if ((Player.playerO.containesAll(5, 4)) && emptyList.contains(3)) {
      index = 3;
    } else if ((Player.playerO.containesAll(8, 7)) && emptyList.contains(6)) {
      index = 6;
    } else if ((Player.playerO.containesAll(6, 3)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerO.containesAll(7, 4)) && emptyList.contains(1)) {
      index = 1;
    } else if ((Player.playerO.containesAll(8, 5)) && emptyList.contains(2)) {
      index = 2;
    } else if ((Player.playerO.containesAll(8, 4)) && emptyList.contains(0)) {
      index = 0;
    } else if ((Player.playerO.containesAll(6, 4)) && emptyList.contains(2)) {
      index = 2;
    } else {
      if (emptyList.isNotEmpty) {
        int x = random.nextInt(emptyList.length);
        index = emptyList[x];
      }
    }

    playGame(index, activePlayer);
  }
}

extension ContainesAll on List {
  containesAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}
