import 'package:flutter/material.dart';
// Finished Navigation Drawer
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
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
  var isChecked = false;


  void _incrementCounter() {
    setState(() {
      if(_counter < 100.0){
        _counter = _counter.ceil() + 1.0;
        myFontSize = myFontSize.ceil() + 1.0;
      }
    });
  }

  // CircleAvatar with centered text
  Widget _buildCircleLabel(String assetPath, String label) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(assetPath),
          radius: 50,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

// CircleAvatar with bottom-center text overlay
  Widget _buildCircleLabelBottom(String assetPath, String label) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(assetPath),
          radius: 50,
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 4),
          color: Colors.black54,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }


  // 4) slider callback to resize text
  void setNewValue(double newValue) {
    setState(() {
      myFontSize = newValue;
      _counter = newValue;
    });
  }

  void buttonClicked(){
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1) Title centered
            Center(
              child: Text(
                'BROWSE CATEGORIES',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // 2) Subtitle aligned left
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Not sure about exactly which recipe you\'re looking for? '
                    'Do a search, or dive into our most popular categories.',
                style: TextStyle(fontSize: 14),
              ),
            ),

            // 3) “By Meat” header centered
            Center(
              child: Text(
                'BY MEAT',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),

            // 4) Row of meat images with centered text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleLabel('images/meat.jpg', 'BEEF'),
                _buildCircleLabel('images/chicken.jpg', 'CHICKEN'),
                _buildCircleLabel('images/pork.jpg', 'PORK'),
                _buildCircleLabel('images/seafood.jpg', 'SEAFOOD'),
              ],
            ),

            // 5) “By Course” header centered
            Center(
              child: Text(
                'BY COURSE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),

            // 6) Row of course images with bottom-center labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleLabelBottom('images/maindish.jpg', 'Main Dishes'),
                _buildCircleLabelBottom('images/salad.jpg', 'Salad Recipes'),
                _buildCircleLabelBottom('images/sidedish.jpg', 'Side Dishes'),
                _buildCircleLabelBottom('images/crockpot.jpg', 'Crockpot'),
              ],
            ),

            // 7) “By Dessert” header centered
            Center(
              child: Text(
                'BY DESSERT',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),

            // 8) Row of dessert images with bottom-center labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleLabelBottom('images/icecream.jpg', 'Ice Cream'),
                _buildCircleLabelBottom('images/brownies.jpg', 'Brownies'),
                _buildCircleLabelBottom('images/pie.jpg', 'Pies'),
                _buildCircleLabelBottom('images/cookies.jpg', 'Cookies'),
              ],
            ),
          ],
        ),
      ),



    );
  }}
