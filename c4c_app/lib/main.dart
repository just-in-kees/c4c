import 'package:flutter/material.dart';
import 'package:c4c_app/modules/global.dart';
import 'package:c4c_app/UI/home/home.dart';
import 'dart:io';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C4C app',
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
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'C4C App'),
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
    return MaterialApp(
        color: Colors.yellow,
        home: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: new Scaffold(
              body: Stack(
                  children: <Widget>[
                  TabBarView(
                    children: [
                      HomePage(),
                      new Container(color: Colors.yellow,),
                      new Container(
                        color: Colors.lightGreen,
                      ),
                      new Container(
                        color: Colors.red,
                      ),
                    ],
                  ),
                    Container (
                      padding: EdgeInsets.only(left: 50),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.orangeAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("C4C", style: homeTitles),
                          Container()
                        ],
                      )
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(top: 70, left: MediaQuery.of(context).size.width*0.5-30),
                      // This is to set the icon in the middle, if you only require an offset, just use e.g. left: 20
                      child: FloatingActionButton(
                        child: Container(
                            child: Icon(Icons.add, size: 50)),
                        backgroundColor: Colors.red,
                        onPressed: (){},
                      ),
                    )
              ],
              ),
//            Choose appbar to have the icons on top, bottomnavigationbar for icons on the bottom
              appBar: AppBar(
                elevation: 0,
                title : new TabBar(
//          bottomNavigationBar: new TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Icons.home),
                  ),
                  Tab(
                    icon: new Icon(Icons.phonelink_lock),
                  ),
                  Tab(
                    icon: new Icon(Icons.attach_money),
                  ),
                  Tab(icon: new Icon(Icons.more_horiz),)
                ],
                labelColor: darkGreyColor,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.purple,
              ),
              backgroundColor: Colors.orangeAccent,
            ),
          ),
        ),
        ),
      );
  }
}
