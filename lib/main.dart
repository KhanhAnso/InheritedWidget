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
          body: DemoInheritedWidget(
              child: OngBa()
          ),
        ));
  }
}

class DemoInheritedWidget extends InheritedWidget {
  int count = 999;

  DemoInheritedWidget({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(DemoInheritedWidget old) {
    return true;
  }
}

class OngBa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChaMe(),
    );
  }
}

class ChaMe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConGai(),
    );
  }
}

class ConGai extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Để ConGai sử dụng được Count thì ta sẽ truy cập vào InheritedWidget này.
    DemoInheritedWidget? demo = context.dependOnInheritedWidgetOfExactType<DemoInheritedWidget>();

    return Center(
      child: Container(
        child: Text(
          demo!.count.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
