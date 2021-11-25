import 'package:flutter/material.dart';
 
class formacao extends StatelessWidget {
  const formacao({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child:Container(
      height: 300,
      width: 800,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://www.opovo.com.br/_midias/jpg/2021/11/11/818x460/1_conheca_casimiro_jornalista_esportivo_apresentador_streamer_torcedor_ilustre_do_vasco-17469300.jpg')
      )
    ));
  }
}