import 'package:flutter/material.dart';
import 'package:c4c_app/modules/materials/transaction_style.dart';
import 'package:c4c_app/UI/pages/home_page.dart';
import 'package:c4c_app/UI/pages/login_page.dart';
import 'helpers/constants.dart';
import 'dart:io';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: appDarkGreyColor,
      ),
      home: LoginPage(),
      routes: routes
      //MyHomePage(title: appTitle),
    );
  }
}

final routes = <String, WidgetBuilder>{
  loginPageTag: (context) => LoginPage(),
  homePageTag: (context) => MyHomePage(title: appTitle),
};

/*void _searchPressed() {
  setState(() {
    if (this._searchIcon.icon == Icons.search) {
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        controller: _filter,
        style: new TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          prefixIcon: new Icon(Icons.search, color: Colors.white),
          fillColor: Colors.white,
          hintText: 'Search by name',
          hintStyle: TextStyle(color: Colors.white),
        ),
      );
    } else {
      this._searchIcon = new Icon(Icons.search);
      this._appBarTitle = new Text(appTitle);
      _filter.clear();
    }
  });
}*/
/*final makeBody = Container(
  // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: lessons.length,
    itemBuilder: (BuildContext context, int index) {
      return makeCard(lessons[index]);
    },
  ),
);*/

