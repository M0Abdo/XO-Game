import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class computer extends StatefulWidget {
  const computer({super.key});

  @override
  State<computer> createState() => _computerState();
}

class _computerState extends State<computer> {
  List sq = ["", "", "", "", "", "", "", "", ""];
  String  winnerPlayer = "";
  int xSocre = 0, oScore = 0, drawScore = 0;
  bool isPlay = true, isWin = false;
  getWinner() {
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && b == c && a != "") {
        return a;
      }
    }
    if (!sq.contains("")) {
      return "Draw";
    }
    return "";
  }

  clearBoard() {
    setState(() {
      for (var i = 0; i < sq.length; i++) {
        sq[i] = "";
      }
    });
  }

  Timer? timer;

  startTimer(bool com) {
    setState(() {
      isPlay = false;
      isWin = true;
    });
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        clearBoard();
        setState(() {
          isPlay = true;
          isWin = false;
        });
        if (com) {
          playComputer();
        }
        timer.cancel();
      },
    );
  }

  // alog Compyter Play
  playComputer() {
    // play => X
    // computer => O
    /*
    1- win O
    2- deafeat X
    3- play any way
     */
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    // win O
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && a == 'O' && c == '') {
        sq[winIndex[i][2]] = 'O';
        return;
      }
      if (a == c && a == 'O' && b == '') {
        sq[winIndex[i][1]] = 'O';
        return;
      }
      if (c == b && b == 'O' && a == '') {
        sq[winIndex[i][0]] = 'O';
        return;
      }
    }
    // win O

    // defeat X
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && a == 'X' && c == '') {
        sq[winIndex[i][2]] = 'O';
        return;
      }
      if (a == c && a == 'X' && b == '') {
        sq[winIndex[i][1]] = 'O';
        return;
      }
      if (c == b && b == 'X' && a == '') {
        sq[winIndex[i][0]] = 'O';
        return;
      }
    }
    // defeat X

    // paly any way
    List indxes = [0, 1, 2, 3, 4, 5, 7, 8]; // index of sq
    indxes.shuffle(Random());
    for (var i = 0; i < sq.length; i++) {
      if (sq[indxes[i]] == "") {
        sq[indxes[i]] = 'O';
        return;
      }
    }
    // paly any way
  }

  // alog Compyter Play
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurpleAccent,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 35,
                        )),
                    Spacer(),
                    Text(
                      "VS Computer",
                      style: TextStyle(fontSize: 32, fontFamily: "frist"),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            clearBoard();
                            xSocre = 0;
                            oScore = 0;
                            drawScore = 0;
                          });
                        },
                        icon: Icon(
                          Icons.restart_alt_outlined,
                          color: Colors.white,
                          size: 35,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "X",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: "frist",
                                color: Colors.black),
                          ),
                          Text(
                            "Score",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: "frist",
                                color: Colors.black),
                          ),
                          Text(
                            "${xSocre}",
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: "second",
                                color: Colors.black),
                          ),
                        ],
                      ),
                      height: 200,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 219, 165, 228),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2.0)),
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "Draw:${drawScore}",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "second",
                            fontWeight: FontWeight.bold),
                      )),
                      margin: EdgeInsets.all(5.0),
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2.0)),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "O",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "frist",
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          Text(
                            "Score",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: "frist",
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          Text(
                            "${oScore}",
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: "second",
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ],
                      ),
                      height: 200,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2.0)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Now is Time for X",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "second",
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 420,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (sq[index] == "" && isPlay) {
                              sq[index] = "X";
                              winnerPlayer = getWinner();
                              if (winnerPlayer == "X") {
                                xSocre++;
                                startTimer(false);
                              } else if (winnerPlayer == "O") {
                                oScore++;
                                startTimer(true);
                              } else if (winnerPlayer == "Draw") {
                                drawScore++;
                                startTimer(false);
                              } else {
                                playComputer();
                                winnerPlayer = getWinner();
                              if (winnerPlayer == "O") {
                                oScore++;
                                startTimer(true);
                              } else if (winnerPlayer == "Draw") {
                                drawScore++;
                                startTimer(true);
                              } 
                              }
                            }
                          });
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            sq[index],
                            style: TextStyle(
                              fontSize: 50,
                              fontFamily: "frist",
                            ),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 5.0)),
                        ),
                      ),
                      itemCount: sq.length,
                    ),
                  ),
                )
              ],
            ),
            if (isWin)
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      winnerPlayer == "Draw"
                          ? "Draw"
                          : "${winnerPlayer} is Win",
                      style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                          fontFamily: "frist"),
                    )),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
