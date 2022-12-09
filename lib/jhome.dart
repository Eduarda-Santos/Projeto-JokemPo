import 'dart:math';

import 'package:flutter/material.dart';

class JokemPoHome extends StatefulWidget {
  const JokemPoHome({super.key});

  @override
  State<JokemPoHome> createState() => _JokemPoHomeState();
}

class _JokemPoHomeState extends State<JokemPoHome> {
  var _imgApp = Image.asset('img/padrao.png');
  var _mensagem = 'Quem venceu o jogo';

  void _joga(String escolhaPlayer) {
    //nao precisa passar um list, pq a propria ferramente ja faz isso
    final listaOpcoes = ['pedra', 'papel', 'tesoura'];
    //nao tem a figura do array, apenas de list
    final escolhaApp = listaOpcoes[Random().nextInt(3)];
    //limite explosivo, nao pega o limite max
    //print('$escolhaPlayer / $escolhaApp / $(_resultado(escolhaPlayer, escolhaApp))');

    setState(() {
      _imgApp = Image.asset('img/$escolhaApp.png');
      _mensagem = _resultado(escolhaPlayer, escolhaApp);
    });
  }

  String _resultado(String escolhaPlayer, String escolhaApp) {
    String mensagem = 'teste';
    if ((escolhaPlayer == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaPlayer == 'papel' && escolhaApp == 'pedra') ||
        (escolhaApp == 'tesoura' && escolhaApp == 'pedra')) {
      mensagem = 'Você Ganhou!';
    } else if (escolhaPlayer == escolhaApp) {
      mensagem = 'Empatamos';
    } else {
      (mensagem = 'Você Perdeu');
    }
    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokepo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _textLabel('Escolha App'),
          //Image.asset('img/padrao.png'),
          _imgApp,
          _textLabel(_mensagem),
          //_textLabel('Quem venceu o jogo'),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                playerChoose('papel'),
                const SizedBox(
                  width: 10,
                ),
                playerChoose('pedra'),
                const SizedBox(
                  width: 10,
                ),
                playerChoose('tesoura'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget playerChoose(String imageName) {
    return Expanded(
      child: GestureDetector(
        //recebe uma funça anonima
        onTap: () => _joga(imageName),
        child: Image.asset(
          //interpolação
          'img/$imageName.png',
          //height: 100,
        ),
      ),
    );
  }

  Widget _textLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
