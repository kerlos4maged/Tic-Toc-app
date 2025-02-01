import 'package:flutter/material.dart';
import 'package:tic_toc/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var orinetation = Orientation.portrait;
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == orinetation
            ? Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  _switchList(),
                  _activePlayer(),
                  const SizedBox(
                    height: 35,
                  ),
                  _expanded(context),
                  _showResult(),
                  _restartApp(context),
                const  SizedBox(height: 20,)
                ],
              )
            : Row(
                children: [
                  _expanded(context),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _switchList(),
                          _activePlayer(),
                          const SizedBox(
                            height: 35,
                          ),
                          _showResult(),
                          _restartApp(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Text _activePlayer() {
    return Text(
      "it's $activePlayer turn",
      style: const TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  SwitchListTile _switchList() {
    return SwitchListTile.adaptive(
        title: const Text(
          "Turn on/off two player",
          style: TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
        value: isSwitched,
        onChanged: (newValue) {
          setState(() {
            isSwitched = newValue;
          });
        });
  }

  Text _showResult() {
    return Text(
      result,
      style: const TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  ElevatedButton _restartApp(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          activePlayer = "X";
          gameOver = false;
          turn = 0;
          result = '';
          Player.playerO.clear();
          Player.playerX.clear();
        });
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).splashColor)),
      label: const Text(
        "Restart",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      icon: const Icon(Icons.restart_alt_sharp, color: Colors.white),
    );
  }

  Expanded _expanded(BuildContext context) {
    return Expanded(
      // the spider gride or playGround you will play in here this GridView.count created this
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.0,
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) => InkWell(
            onTap: gameOver == true
                ? null
                : () => setState(() {
                      _ontap(index);
                    }),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).shadowColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  Player.playerX.contains(index)
                      ? "X"
                      : Player.playerO.contains(index)
                          ? "O"
                          : Player.empty,
                  style: TextStyle(
                      fontSize: 50,
                      color: Player.playerX.contains(index)
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _ontap(int index) async {
    if ((!Player.playerX.contains(index) || Player.playerX.isEmpty) &&
        (!Player.playerO.contains(index) || Player.playerO.isEmpty)) {
      game.playGame(index, activePlayer);
      updatePlayer();

      if (isSwitched && gameOver == false) {
        await game.autoPlay(activePlayer);
        updatePlayer();
      }
    }
  }

  void updatePlayer() {
    setState(() {
      activePlayer = activePlayer == "X" ? "O" : "X";
      String winnerPlaye = game.checkWinner();
      turn = turn + 1;

      if (winnerPlaye == '' && turn == 9) {
        result = "It's Draw";
        gameOver = true;
      } else if (winnerPlaye == 'X') {
        result = "Winner is X";
        gameOver = true;
      } else if (winnerPlaye == 'O') {
        result = "Winner is O";
        gameOver = true;
      }
    });
  }
}
