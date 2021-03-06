import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      backgroundColor: Colors.black38,
      body: body(),
    );
  }

  title() {
    return AppBar(
      title: t('Vagas', 25, Colors.black),
      backgroundColor: Colors.blue,
    );
  }

  body() {
    return ListView(children: <Widget>[
      p(c(col('Desenvolvedor Backend',  0, 10, 20, 0)), 20, 15, 20, 15),
      p(c(col('Engenheiro de Dados',    0, 10, 20, 0)), 20, 15, 20, 15),
      p(c(col('Desenvolvedor Frontend', 0, 10, 20, 0)), 20, 15, 20, 15),
      p(c(col('Designer',               0, 10, 20, 0)), 20, 15, 20, 15),
      p(c(col('Contador',               0, 10, 20, 0)), 20, 15, 20, 15),
    ]);
  }

  p(context, double L, double T, double R, double B) {
    return Padding(
      padding: EdgeInsets.fromLTRB(L, T, R, B),
      child: context,
    );
  }

  c(context) {
    return Container(
      height: 165,
      color: Colors.white,
      child: context,
    );
  }

  t(text, double size, color) {
    return Text(text, style: TextStyle(fontSize: size, color: color));
  }

  col(name, double L, double T, double R, double B) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          p(t(name, 25, Colors.black), L, T, R, B),
          p(t('Salário: R\$ xxxxx.xx', 20, Colors.blue), 0, 5, 115, 0),
          p(t('Descrição:---------------------------------', 20, Colors.blue), 5, 5, 10, 0),
          p(t('-------------------------------------------------', 20, Colors.blue), 5, 5, 10, 0),
          p(t('Contato: (XX) XXXXX-XXXX', 20, Colors.blue), 0, 5, 35, 0),
        ]);
  }
}