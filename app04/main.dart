import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController etanol = TextEditingController();
  TextEditingController gasolina = TextEditingController();

  String rsp = "";

  void _calc() {
    setState(() {
      double x = double.parse(etanol.text);
      double y = double.parse(gasolina.text);

      double res = (x / y);

      if (res <= 0.7)
        rsp = 'Use Etanol';
      else {
        rsp = 'Use Gasolina';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      backgroundColor: Colors.,
      body: _body(),
    );
  }

  _title() {
    return AppBar(
        title: Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue);
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _field("Etanol", etanol),
          _field("Gasolina", gasolina),
          _button(),
          _text(rsp),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  _foto() {
    return Center(
      child: Image.network(
        'https://s2.glbimg.com/fLLjtcmosminFpbQVwWjJ6qEdNU=/512x320/smart/e.glbimg.com/og/ed/f/original/2015/09/10/ads_macgyver1.jpg',
        height: 150,
        width: 150,
      ),
    );
  }


  _field(String alt, var_name) {
    return Container(
        child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: alt,
              labelStyle: TextStyle(color: Colors.black),
            ),
            controller: var_name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 25)));
  }

  _button() {
    return Padding(
        padding: EdgeInsets.all(0),
        child: Container(
            child: ElevatedButton(
              onPressed: _calc,
              child: Text('Calcular',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
            )));
  }

  _text(txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}