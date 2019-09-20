import 'package:flutter/material.dart';
import 'package:myapp/detailPage.dart';
import 'package:myapp/pages/MyApp2.dart';

void main() => runApp(MyApp2());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Text(
                  'Healthy',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Food',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25.0),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: MediaQuery.of(context).size.height - 170.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 25, right: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(
                      children: <Widget>[
                        _buildFoodItem('assets/images/cucumber.jpg', 'Cucumber',
                            '\$24.00'),
                        _buildFoodItem(
                            'assets/images/cabbage.jpg', 'Cabbage', '\$26.00'),
                        _buildFoodItem(
                            'assets/images/potato.jpg', 'Potato', '\$30.00'),
                        _buildFoodItem(
                            'assets/images/yam.jpg', 'Yam', '\$31.00'),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(color: Colors.orange),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey)),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white),
                          child: Icon(Icons.shopping_cart),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              // border: Border.all(color: Colors.black),
                              color: Color(0xFF160b24)),
                          child: Center(
                            child: Text(
                              'Check out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                    heroTag: imgPath,
                    foodName: foodName,
                    foodPrice: price,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: imgPath,
                    child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75,
                      width: 75,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        foodName,
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
