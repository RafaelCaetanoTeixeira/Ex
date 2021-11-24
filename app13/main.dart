import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: title(),
          body: body(),
        ));
  }

  title() {
    return AppBar(
        title: Text('Bottom Nav',
            style: TextStyle(fontSize: 20, color: Colors.black)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: 'Pessoal'),
            Tab(text: 'Formação'),
            Tab(text: 'Experiência'),
          ],
        ));
  }

  body() {
    return TabBarView(
      children: [
        image(),
        image(),
        image(),
      ],
    );
  }

  image() {
    return Center(
        child: Image(
            image: NetworkImage(
                'https://c.tenor.com/_0TzMJZezjkAAAAd/caze-dançando-caze.gif'),
            fit: BoxFit.cover));
  }
}