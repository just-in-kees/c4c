import 'package:c4c_app/modules/widgets/transaction_widget.dart';
import 'package:c4c_app/modules/materials/transaction_style.dart';
import 'package:flutter/material.dart';
import 'package:c4c_app/helpers/constants.dart';

String _searchText = "";
Icon _searchIcon = new Icon(Icons.search);
Widget _appBarTitle = new Text(appTitle);

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
          length: 1,
          child: new Scaffold(
            body: Stack(
              children: <Widget>[
                TabBarView(
                  children: [
                    HomePage()
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
                /*Container(
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
                    )*/
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
            //body: makeBody,
            bottomNavigationBar: makeBottom,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  List<HomeTransaction> transactionSections;
  @override
  Widget build(BuildContext context) {
   return Container(
     color: appDarkGreyColor,
     child: ListView(
       padding: EdgeInsets.only(top: 110),
       children: getList(),
     ),
   );
  }

  List<Widget> getList() {
    List<HomeTransaction> list = [];
    for (int i = 0; i < 15; i ++) {
      list.add(HomeTransaction(title: "hello", futureTransaction: fetchTransaction(i))); //,title: "Transaction",));
    }
    return list;
  }

}

final topAppBar = AppBar(
  elevation: 0.1,
  backgroundColor: appDarkGreyColor,
  title: Text("C4C"),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.local_phone),
      onPressed: () {},
    ),
    IconButton(icon: _searchIcon, onPressed: (){})
  ],
);

final makeBottom = Container(
  height: 55.0,
  child: BottomAppBar(
    color: appDarkGreyColor,
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