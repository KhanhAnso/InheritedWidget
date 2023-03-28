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
          body: MyContainer(
            child: Counter(),
          ),
        ));
  }
}

class MyContainer extends StatefulWidget {

  Widget child;

  MyContainer({required this.child});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {

  //
  int data = 0;
  //khi hàm này được gọi thi stateFul Widget bị rebuild
  // => Khi đó nó kéo theo InheritedWidget bị rebuild
  increment(){
    setState(() {
      data++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoInheritedWidget(child: widget.child, state: this);
    //widget.child : là child của MyContainer.child
  }
}

class DemoInheritedWidget extends InheritedWidget {

  Widget child;
  _MyContainerState state;


  DemoInheritedWidget({required this.child, required this.state}) : super(child: child);

  @override
  bool updateShouldNotify(DemoInheritedWidget old) {
    return true;
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {

    DemoInheritedWidget? demo = context.dependOnInheritedWidgetOfExactType<DemoInheritedWidget>();

    return Center(
      child: Column(
        children: <Widget>[
          Text(demo!.state.data.toString(), style: TextStyle(fontSize: 40)),
          ElevatedButton(onPressed: (){
            demo.state.increment(); //call increment()
          },
            child: Text("Click Me"),
          )
        ],
      ),
    );
  }
}
