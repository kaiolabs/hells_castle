import 'package:flutter/material.dart';
import 'package:hells_castle/Ranking.dart';
import 'package:hells_castle/utils/pontuacao.dart';

import 'game.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    // Sounds.playBackgroundSound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_hellscastle.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.69),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 130,
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(7),
                          shadowColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 127, 148, 255)),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 38, 43, 68),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Pontuacao.isWin = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Game(),
                            ),
                          );
                        },
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Normal',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 130,
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(7),
                          shadowColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 127, 148, 255)),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 38, 43, 68),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Ranking(),
                            ),
                          );
                        },
                        child: const Text(
                          'Ranking',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Normal',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
