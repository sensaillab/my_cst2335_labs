import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CST2335 Lab 1',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var instead of int for floats
  var _counter = 0.0;
// set the font size
  var myFontSize = 30.0;

  void _incrementCounter() {
    setState(() {
      if(_counter < 100.0){
        _counter = _counter.ceil() + 1.0;
        myFontSize = myFontSize.ceil() + 1.0;
      }
    });
  }

  // 4) slider callback to resize text
  void setNewValue(double newValue) {
    setState(() {
      myFontSize = newValue;
      _counter = newValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // removed const, now uses myFontSize
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: myFontSize),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: myFontSize),
            ),


            // 4) slider to control myFontSize
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Slider(
                min: 10.0,
                max: 100.0,
                value: myFontSize,

                onChanged: setNewValue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
