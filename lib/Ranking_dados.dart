// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hells_castle/utils/pontuacao.dart';

import 'menu.dart';

class RankingDados extends StatefulWidget {
  const RankingDados({Key? key}) : super(key: key);

  @override
  State<RankingDados> createState() => _RankingDadosState();
}

class _RankingDadosState extends State<RankingDados> {
  get label => null;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          color: const Color.fromARGB(255, 59, 67, 110),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
        ),
        Visibility(
          visible: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 35, top: 20),
                child: Text(
                  'Estatísticas',
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
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Text('Pontuação',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Normal',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('${Pontuacao.pontos}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Normal',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 20),
                                child: SizedBox(
                                  width: 500,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Insira seu nome';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.done,
                                    autofocus: false,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 255, 0, 0),
                                          width: 1,
                                        ),
                                      ),
                                      hintText: 'Nome do jogador',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      border: InputBorder.none,
                                      counterText: '',
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 45,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(7),
                                    shadowColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 127, 148, 255)),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 38, 43, 68),
                                    ),
                                    foregroundColor: MaterialStateProperty.all(
                                      Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Menu()),
                                          (Route<dynamic> route) => false);
                                    }
                                  },
                                  child: const Text(
                                    'Salvar',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Normal',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
