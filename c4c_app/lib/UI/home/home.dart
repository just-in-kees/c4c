import 'package:c4c_app/modules/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  List<HomeTransaction> transactionSections;
  @override
  Widget build(BuildContext context) {
   return Container(
     color: Color.fromRGBO(64, 75, 96, .9),
     child: ListView(
       padding: EdgeInsets.only(top: 110),
       children: getList(),
     ),
   );
  }

  List<Widget> getList() {
    List<HomeTransaction> list = [];
    for (int i = 0; i < 10; i ++) {
      list.add(HomeTransaction(title: "hello", futureTransaction: fetchTransaction(i))); //,title: "Transaction",));
    }
    return list;
  }

}