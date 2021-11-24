import 'package:flutter/material.dart';
import 'about.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  String sex = 'Não Informado';
  String sch = 'Não Informado';
  double current = 2000;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: title(), backgroundColor: Colors.white, body: body(context));
  }

  title() {
    return AppBar(
      title: Text(
        'Banco Itaú',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                cont(name, 'Nome', TextInputType.name),
                cont(age, 'Idade', TextInputType.number),
                pad(
                    row(
                        pad(
                            db(sex, <String>[
                              'Não Informado',
                              'Masculino',
                              'Feminino',
                              'Não binário'
                            ], (String? newValue) {
                              setState(() {
                                sex = newValue!;
                              });
                            }),
                            20,
                            0,
                            25,
                            0),
                        db(sch, <String>[
                          'Não Informado',
                          'Ensino Fundamental',
                          'Ensino Medio',
                          'Curso Superior',
                          'Pos Graduação'
                        ], (String? newValue) {
                          setState(() {
                            sch = newValue!;
                          });
                        })),
                    0,
                    5,
                    0,
                    0),
                pad(
                    row(
                        txt('Credito Limite', 17.5, Colors.black,
                            FontWeight.w500),
                        Container(width: 150, child: sld())),
                    10,
                    10,
                    0,
                    0),
                row(
                    pad(
                        txt('Nacionalidade BR', 20, Colors.black,
                            FontWeight.normal),
                        0,
                        0,
                        10,
                        0),
                    swt()),
                but(context)
              ]),
        ],
      ),
    );
  }

  but(BuildContext context) {
    return ElevatedButton(
      child: txt('Confirmar', 20, Colors.black, FontWeight.normal),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return About(
            abName: name.text,
            abAge: age.text,
            abSex: sex,
            abSchl: sch,
            abCurrent: current,
            abCheck: check,
          );
        }));
      },
    );
  }

  swt() {
    return Checkbox(
      checkColor: Colors.blue,
      fillColor: MaterialStateProperty.all(Colors.black),
      value: check,
      onChanged: (bool? value) {
        setState(() {
          check = value!;
        });
      },
    );
  }

  sld() {
    return Slider(
      value: current,
      activeColor: Colors.blue,
      min: 1000,
      max: 10000,
      divisions: 100,
      label: current.round().toString(),
      onChanged: (double value) {
        setState(() {
          current = value;
        });
      },
    );
  }

  db(String bvalue, array, press) {
    return DropdownButton<String>(
      value: bvalue,
      style: TextStyle(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
      underline: Container(height: 2, color: Colors.blue),
      onChanged: press,
      items: array.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  cont(tf_ctr, hnt, intype) {
    return pad(
        Container(
            width: 320,
            height: 70,
            color: Colors.transparent,
            child: Center(child: tf(tf_ctr, hnt, intype))),
        20,
        10,
        0,
        0);
  }

  row(con, cont) {
    return Row(children: <Widget>[
      con,
      cont,
    ]);
  }

  pad(context, double l, double t, double r, double b) {
    return Padding(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      child: context,
    );
  }

  txt(content, double size, color, weight) {
    return Text(content,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight));
  }

  tf(controll, hint, ipt_type) {
    return TextField(
      keyboardType: ipt_type,
      controller: controll,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}