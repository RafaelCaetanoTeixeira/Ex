import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController cep = new TextEditingController();
String inf = '';

findMe() async {
  String url = 'https://viacep.com.br/ws/${cep.text}/json/';

  http.Response ans = await http.get(Uri.parse(url));

  Map<String, dynamic> back = json.decode(ans.body);
  String logradouro = back['logradouro'];
  String bairro = back['bairro'];
  String localidade = back['localidade'];
  String uf = back['uf'];

  setState(() {
    inf = '$logradouro \n$bairro - $localidade ($uf)';
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: body()
    );
  }

  title(){
    return AppBar(
      title: Text('Cep x Endereço'),
      centerTitle: true,
      backgroundColor: Colors.blue
    );
  }

  body(){
    return Container(
      margin: EdgeInsets.all(20),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:tf(TextInputType.number, cep, 'CEP')),
        Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:bt()),
        Container(
          width: 300,
          height: 200,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(inf,
          style: TextStyle(fontSize:20, color: Colors.black))
        )
        ]
      )
    );
  }

  bt(){
    return ElevatedButton(
      child: Text('Encontrar', style: TextStyle(fontSize:20, color: Colors.white)),
      onPressed: findMe,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size.fromRadius(double.maxFinite)),
        backgroundColor: MaterialStateProperty.all(Colors.blue))
    );
  }

  tf(keyType, controll, txt){
    return TextField(
      keyboardType: keyType,
      controller: controll,
      decoration: InputDecoration(
        labelText: txt,
        labelStyle: TextStyle(color: Colors.blue)),
      style: TextStyle(color: Colors.blue, fontSize:40)
    );
  }
}