import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: OngBa(),
      )
    );
  }
}

class OngBa extends StatelessWidget {

  int count = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChaMe(count),
    );
  }
}

class ChaMe extends StatelessWidget {

  //count để hứng data từ ông bà
  late int count;
  //Constructor ChaMe
  ChaMe(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConGai(count),
    );
  }
}

class ConGai extends StatelessWidget {

  //count để hứng data từ ông bà
  late int count;
  //constructor
  ConGai(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("$count", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}


