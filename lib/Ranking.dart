// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  // late Future<List<Jogador>> futureJogadores;

  get label => null;

  // Future<List<Jogador>> pegarJogador() async {
  //   var url =
  //       Uri.parse("https://api-gamer-solution.gamers-club.repl.co/readAll");
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var json = convert.jsonDecode(response.body);
  //     List listaJogadores = json.decode(response.body);
  //     return listaJogadores.map((json) => Jogador.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

  // @override
  // void initState() {
  //   futureJogadores = pegarJogador();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: const Color.fromARGB(255, 59, 67, 110),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
      ),
      Positioned(
          top: 30,
          left: 20,
          // right: 0,
          // bottom: 0,
          child: SizedBox(
            width: 80,
            height: 40,
            child: ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 38, 43, 68),
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text("")),
          )),
      Visibility(
        visible: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 35, top: 20),
              child: Text(
                'Ranking',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Normal',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Card(
                elevation: 9,
                child: Container(
                    color: const Color.fromARGB(255, 38, 43, 68),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(children: [
                      Column(
                        children: [
                          Container(
                            color: const Color.fromARGB(218, 97, 108, 164),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: Text('Nome',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Normal',
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: Text('Pontuação',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Normal',
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('Kaio',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('975',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('Isabelle',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('875',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('Juliana',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('759',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('Teste',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text('576',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Normal',
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      )
                    ])),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
