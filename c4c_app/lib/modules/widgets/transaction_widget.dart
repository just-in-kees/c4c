import 'package:c4c_app/modules/global.dart';
import 'package:flutter/material.dart';

class HomeTransaction extends StatelessWidget {

  final String title;
  HomeTransaction({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Radio(

          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text(title, style: transactionTitles,)
              ],
            ),
          ),
          Container(
            child: FloatingActionButton(
              child: Container(
                  child: Icon(Icons.add_to_home_screen, size: 50)),

            ),
          ),

        ],
      ),
    );
  }

}
