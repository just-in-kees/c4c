import 'package:flutter/material.dart';
import 'package:c4c_app/modules/global.dart';
import 'package:c4c_app/UI/home/home.dart';
import 'dart:io';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C4C app',
      theme: ThemeData(
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
        color: Colors.white,
        home: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: new Scaffold(
              body: Stack(
                  children: <Widget>[
                  TabBarView(
                    children: [
                      HomePage(),
                      new Container(color: Color.fromRGBO(58, 66, 86, 1.0)),
                      new Container(color: Color.fromRGBO(58, 66, 86, 1.0)),
                      new Container(color: Color.fromRGBO(58, 66, 86, 1.0)),
                    ],
                  ),
                    Container (
                      padding: EdgeInsets.only(left: 50),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.white70,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Transactions", style: homeTitles),
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
                        backgroundColor: Colors.green,
                        onPressed: (){},
                      ),
                    )
              ],
              ),
//            Choose appbar to have the icons on top, bottomnavigationbar for icons on the bottom
              /*appBar: AppBar(
                elevation: 0.1,
                backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                title : new TabBar(
//              bottomNavigationBar: new TabBar(
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
                unselectedLabelColor: Colors.white70,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.white12,
              ),
            ),*/
              appBar: topAppBar,
              bottomNavigationBar: makeBottom,
          ),
        ),
        ),
      );
  }
}
final topAppBar = AppBar(
  elevation: 0.1,
  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  title: Text("C4C"),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.local_phone),
      onPressed: () {},
    )
  ],
);

final makeBottom = Container(
  height: 55.0,
  child: BottomAppBar(
    color: Color.fromRGBO(58, 66, 86, 1.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.blur_on, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.hotel, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.account_box, color: Colors.white),
          onPressed: () {},
        )
      ],
    ),
  ),
);