import 'package:flutter/material.dart';
import 'package:hells_castle/Ranking_dados.dart';

class Dialogs {
  static void showGameOver(BuildContext context, VoidCallback playAgain) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/game_over.png',
                height: 180,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: playAgain,
                child: const Text(
                  'Jogar novamente!',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 20.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static void showCongratulations(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'PARABÊNS!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Normal',
                        fontSize: 30.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 130),
                  child: Text(
                    'Agradeçemos por testar o game.\nTalvez poderemos ter uma continuação do game!\nEspero que tenha gostado!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Normal',
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(7),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 38, 43, 68),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.black,
                      ),
                    ),
                    child: const Text("OK",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Normal',
                            fontSize: 17.0)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const RankingDados()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
