import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List x_o_List = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool isTap = true;
  int x_score = 0;
  int o_score = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("X_O Game"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: const Color.fromARGB(255, 120, 120, 25),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: x_o_List.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => tap_x_o(index),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Text(
                              x_o_List[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          )),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Player X",
                          style: TextStyle(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$x_score',
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Player O", style: TextStyle(fontSize: 35)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('$o_score', style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void tap_x_o(int i) {
    if (isTap && x_o_List[i] == '') {
      setState(() {
        x_o_List[i] = 'O';
        isTap = !isTap;
      });
    } else if (!isTap && x_o_List[i] == '') {
      setState(() {
        x_o_List[i] = 'X';
        isTap = !isTap;
      });
    }
    count++;
    _checkWinner();
  }

  void _checkWinner() {
    if (x_o_List[0] == x_o_List[1] &&
        x_o_List[0] == x_o_List[2] &&
        x_o_List[0] != '') {
      _showDialog(winner: x_o_List[0]);
    }
    if (x_o_List[3] == x_o_List[4] &&
        x_o_List[3] == x_o_List[5] &&
        x_o_List[3] != '') {
      _showDialog(winner: x_o_List[3]);
    }
    if (x_o_List[6] == x_o_List[7] &&
        x_o_List[6] == x_o_List[8] &&
        x_o_List[6] != '') {
      _showDialog(winner: x_o_List[6]);
    }
    if (x_o_List[0] == x_o_List[3] &&
        x_o_List[0] == x_o_List[6] &&
        x_o_List[0] != '') {
      _showDialog(winner: x_o_List[0]);
    }
    if (x_o_List[1] == x_o_List[4] &&
        x_o_List[1] == x_o_List[7] &&
        x_o_List[1] != '') {
      _showDialog(winner: x_o_List[1]);
    }
    if (x_o_List[2] == x_o_List[5] &&
        x_o_List[2] == x_o_List[8] &&
        x_o_List[2] != '') {
      _showDialog(winner: x_o_List[2]);
    }

    if (x_o_List[0] == x_o_List[4] &&
        x_o_List[0] == x_o_List[8] &&
        x_o_List[0] != '') {
      _showDialog(winner: x_o_List[0]);
    }
    if (x_o_List[2] == x_o_List[4] &&
        x_o_List[2] == x_o_List[6] &&
        x_o_List[2] != '') {
      _showDialog(winner: x_o_List[2]);
    }

    if (count == 9) {
      _showDialog(winnerExist: false);
      _repeatGame();
    }
  }

  void _showDialog({String winner = '', bool winnerExist = true}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(winnerExist
                ? 'Winner is Player $winner!'
                : 'Winner is not defined'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Play again'),
              )
            ],
          );
        });
    if (winner == 'O') {
      setState(() {
        o_score++;
      });
    } else if (winner == 'X') {
      setState(() {
        x_score++;
      });
    }
    count = 0;
    _repeatGame();
  }

  void _repeatGame() {
    for (int i = 0; i < 9; i++) {
      x_o_List[i] = '';
    }
  }
}
