import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mesangem = "Escolha uma Opção Abaixo";

  _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do Usuario " + escolhaUsuario);
    print("Escolha do App " + escolhaApp);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });

        break;

      case "papel":
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });

        break;

      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });

        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _mesangem = "O usuario Venceu";
      });
    }else if (escolhaApp == escolhaUsuario){
      setState(() {
        _mesangem = "Empate";
      });
    }else{
      _mesangem = "O Computador Venceu";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text
          //imagem
          //text Resultado
          //Linha 3 imagens

          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Image(
            image: this._imageApp,
          ),

          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mesangem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                //pedra
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                //Papel
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                //Tesoura
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),

              // Image.asset("images/pedra.png", height: 100),
              // Image.asset("images/papel.png", height: 100),
              // Image.asset("images/tesoura.png", height: 100),
            ],
          )
        ],
      ),
    );
  }
}
