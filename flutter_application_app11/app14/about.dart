import 'package:flutter/material.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  String abName;
  String abAge;
  String abSex;
  String abSchl;
  double abCurrent;
  bool abCheck;

  About(
      {required this.abName,
      required this.abAge,
      required this.abSex,
      required this.abSchl,
      required this.abCurrent,
      required this.abCheck});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: t(),
      body: b(),
    );
  }

  t() {
    return AppBar(
        title: Text("Informações Cadastro"),
        centerTitle: true,
        backgroundColor: Colors.blue);
  }

  b() {
    return SingleChildScrollView(
      child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            txt('Nome: $abName', 20, Colors.black, FontWeight.bold),
            txt('Idade: $abAge', 20, Colors.black, FontWeight.bold),
            txt('Sexo: $abSex', 20, Colors.black, FontWeight.bold),
            txt('Escolaridade: $abSchl', 20, Colors.black, FontWeight.bold),
            txt('Limite de Credito: R\$$abCurrent', 20, Colors.black,
                FontWeight.bold),
            txt('Brasileiro: $abCheck', 20, Colors.black, FontWeight.bold),
          ])),
    );
  }

  txt(content, double size, color, weight) {
    return Text(content,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight));
  }

  bot(BuildContext context) {
    return ElevatedButton(
      child: txt('Confirmar', 20, Colors.black, FontWeight.normal),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}