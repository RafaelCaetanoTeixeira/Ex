import 'package:flutter/material.dart';
import 'pessoal.dart';
import 'formacao.dart';
import 'experiencia.dart';
import 'inicio.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;

  // ignore: non_constant_identifier_names
  final tab_list = [
    
    inicio(),
    pessoal(),
    formacao(),
    experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: tab_list[current],
      drawer: drawer(),
    );
  }

  title(){
    return AppBar(
      title: Text("Navegação Animais"),
      backgroundColor: Colors.blue,
    );
  }

  drawer(){
    return 
    Theme(
    data: Theme.of(context).copyWith(canvasColor: Colors.blue),
    child:Drawer(
        child: ListView(
        children: [
          circle(),
          list('Macacos','1',Icons.account_box_outlined,0),
          list('Surf','2', Icons.account_circle,1),
          list('Casimiros','3', Icons.ad_units_outlined,2),
          list('Não chupa, morde e lambe','4', Icons.add_chart_outlined,3)
        ],
      )
    ),
    );
  }

  circle(){
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png')
        )
      )
    );
  }

  list(title, sub, icon, c){
    return ListTile(
            title: Text(title),
            subtitle: Text(sub),
            trailing: Icon(icon),
            onTap: (){
              setState(() {
                Navigator.pop(context);
                current = c;
              });
            },
          );
  }
}