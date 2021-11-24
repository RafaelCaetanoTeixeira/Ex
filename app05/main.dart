import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController peso = new TextEditingController();
  TextEditingController alt = new TextEditingController();
  String rsp = "";
  String img =
      'https://pt.calcuworld.com/wp-content/uploads/sites/6/2019/07/imc--150x150.png';

  void calculate() {
    setState(() {
      double p = double.parse(peso.text);
      double a = double.parse(alt.text);

      if (a > 100) {
        a = a / 100;
      }

      double imc = p / (a * a);

      if (imc < 18.5) {
        rsp = "Abaixo do Peso";
        img =
        'https://media.discordapp.net/attachments/707338586986512518/912491285812744242/104620698_prmo_imc_br-nc.png?width=719&height=404';
      } else if (imc < 25) {
        rsp = "Peso Normal";
        img =
        'https://media.discordapp.net/attachments/707338586986512518/912491285812744242/104620698_prmo_imc_br-nc.png?width=719&height=404';
      } else if (imc < 30) {
        rsp = "Sobrepeso";
        img =
        'https://media.discordapp.net/attachments/707338586986512518/912491285812744242/104620698_prmo_imc_br-nc.png?width=719&height=404';
      } else if (imc < 35) {
        rsp = "Obesidade Grau I";
        img =
        'https://media.discordapp.net/attachments/707338586986512518/912491285812744242/104620698_prmo_imc_br-nc.png?width=719&height=404';
      } else if (imc < 40) {
        rsp = "Obesidade Grau II";
        img =
        "https://media.discordapp.net/attachments/707338586986512518/912491285812744242/104620698_prmo_imc_br-nc.png?width=719&height=404";
      } else {
        rsp = "Obesidade Grau III";
        img =
        'https://media.discordapp.net/attachments/707338586986512518/912491285812744242/104620698_prmo_imc_br-nc.png?width=719&height=404';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  header() {
    return AppBar(
        title: Text(
          'IMC',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue);
  }

  body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: <Widget>[
          image(img),
          row(),
          button(),
          answer(rsp, 30),

        ],
      ),
    );
  }

  image(imag) {
    return Image.network(
      imag,
      height: 300,
      width: 300,
      fit: BoxFit.cover,
    );
  }

  container(content) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 80,
      width: 150,
      child: content,
    );
  }

  textfield(String field, controll) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controll,
      decoration: InputDecoration(
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        hintText: field,
        hintStyle: TextStyle(fontSize: 20),
      ),
    );
  }

  row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        container(textfield("Peso", peso)),
        container(textfield("Altura", alt)),
      ],
    );
  }

  button() {
    return Container(
      height: 50,
      width: 280,
      child: ElevatedButton(
          onPressed: calculate,
          child: Text(
            'Calcular Peso',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          )),
    );
  }

  answer(content, double size) {
    return Text(content, style: TextStyle(fontSize: size));
  }
}