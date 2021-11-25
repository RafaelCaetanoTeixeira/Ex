import 'package:flutter/material.dart';
 
class pessoal extends StatelessWidget {
  const pessoal({Key? key}) : super(key: key);
 
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
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfGVCzeqHLNwQzKxtxBbr75A8zu72F6A0q7w&usqp=CAU')
      )
    ));
  }
}