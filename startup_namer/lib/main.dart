// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

Future<Transaction> fetchTransaction(int index) async {

  final token = 'eyJhbGciOiJFUzI1NiIsImtpZCI6ImY2ZGY1NzAyLTEwYWItNGI5ZS05ZGYwLTU5YWRhNzgxZjE5MSIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODU5MjMxNjksImlhdCI6MTU4NTkxNTk2OSwiaXNzIjoidGluazovL2F1dGgiLCJqdGkiOiI4NDk1MzhiNy05NmNjLTRmMjAtOGJmMi1lZjZmNTdhZDliZjkiLCJvcmlnaW4iOiJtYWluIiwic2NvcGVzIjpbImludmVzdG1lbnRzOnJlYWQiLCJ1c2VyOnJlYWQiLCJhY2NvdW50czpyZWFkIiwidHJhbnNhY3Rpb25zOnJlYWQiXSwic3ViIjoidGluazovL2F1dGgvdXNlci82NjgzNjE4NzQ2M2U0M2Q2YWI4ZGU2YjMxOThhOTExYSIsInRpbms6Ly9hcHAvaWQiOiJmNTRmNWYzNGIzOWM0NGE4OWJiYTQ1OGMzMzY4N2M4MiJ9.ezlD59EH8-5oNaLXgDPYrw_PM6UbeZ-6fAt6jHRyyzEch5nDwBHLxqpLcSIoH8gKpZ0zDRSbDg02rlLchrwcRg';

  final response = await http.get(
      'https://api.tink.com/api/v1/transactions/',
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
  },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseJson = json.decode(response.body);
    return Transaction.fromJson(responseJson[index]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load transactions ' + response.statusCode.toString() );
  }
}


class _MyAppState extends State<MyApp> {
  Future<Transaction> futureTransaction;
  final List <Transaction> _transactions = <Transaction>[];
  final Set<Transaction> _saved = Set<Transaction>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);


  @override
  void initState() {
    super.initState();
    futureTransaction = fetchTransaction(10);
  }

  String tester = '';

  void changedata(){
    setState(() {
      fetchTransaction(1) .toString();
      FutureBuilder<Transaction>(
        future: futureTransaction,
        builder: (context, snapshot) {
          futureTransaction = fetchTransaction(10);
          if (snapshot.hasData) {
            return Text(snapshot.data.description);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions C4C',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transaction Fetch Example'),
          actions: <Widget>[
            const SizedBox(height: 30),
          ],
        ),
        body:
//        MyStatelessWidget(),
        Column(
          children:[
              RaisedButton(
                onPressed: () {},
                child: const Text('Other Transaction', style: TextStyle(fontSize: 20)),
              ),
            const SizedBox(height: 30),
            IconButton(icon: Icon(Icons.navigate_next), onPressed: changedata),//() => futureTransaction = fetchTransaction(0)),

            Text('$tester'),
//          justDoIt(),


          FutureBuilder<Transaction>(
            future: futureTransaction,
            builder: (context, snapshot) {
              futureTransaction = fetchTransaction(10);
              if (snapshot.hasData) {
                return Text(snapshot.data.description);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          )
        ],
        ),
      ),
    );
  }


void justDoIt(tester) {
  FutureBuilder<Transaction>(
    future: futureTransaction,
    builder: (context, snapshot) {
      futureTransaction = fetchTransaction(0);
      if (snapshot.hasData) {
        return Text(snapshot.data.description);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  );
}

  void _pushSaved() {
    futureTransaction = fetchTransaction(1);
    return;
  }

}
/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget trans(int index) {
    fetchTransaction(index);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () => fetchTransaction(10),
            child: const Text('Other Transaction', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
          trans(10),
        ],
      ),
    );
  }
}


class Transaction {
  final String	accountId	;
  final double	amount	;
  final String	categoryId	;
  final String	categoryType	;
  final String	credentialsId	;
  final int	date	;
  final String	description	;
  final String	formattedDescription	;
  final String	id	;
  final int	inserted	;
  final Map	internalPayload	;
  final int	lastModified	;
  final String	merchantId	;
  final String	notes	;
  final double	originalAmount	;
  final int	originalDate	;
  final String	originalDescription	;
  final Map	payload	;
  final String	MESSAGE	;
  final String	TRANSFER_ACCOUNT_NAME_EXTERNAL	;
  final String	DETAILS	;
  final bool	pending	;
  final int	timestamp	;
  final String	type	;
  final String	userId	;
  final bool	upcoming	;
  final bool	userModifiedAmount	;
  final bool	userModifiedCategory	;
  final bool	userModifiedDate	;
  final bool	userModifiedDescription	;
  final bool  userModifiedLocation	;
  final Map	currencyDenominatedAmount	;
  final int	unscaledValue	;
  final int	scale	;
  final String	currencyCode	;
  final Map	currencyDenominatedOriginalAmount	;
  final List	parts	;
  final Map	partnerPayload	;
  final double	dispensableAmount	;
  final bool	userModified	;

  Transaction({this.	accountId	,
    this.amount	,
    this.categoryId	,
    this.categoryType	,
    this.credentialsId	,
    this.date	,
    this.description	,
    this.formattedDescription	,
    this.id	,
    this.inserted	,
    this.internalPayload	,
    this.lastModified	,
    this.merchantId	,
    this.notes	,
    this.originalAmount	,
    this.originalDate	,
    this.originalDescription	,
    this.payload	,
    this.MESSAGE	,
    this.TRANSFER_ACCOUNT_NAME_EXTERNAL	,
    this.DETAILS	,
    this.pending	,
    this.timestamp	,
    this.type	,
    this.userId	,
    this.upcoming	,
    this.userModifiedAmount	,
    this.userModifiedCategory	,
    this.userModifiedDate	,
    this.userModifiedDescription	,
    this.userModifiedLocation	,
    this.currencyDenominatedAmount	,
    this.unscaledValue	,
    this.scale	,
    this.currencyCode	,
    this.currencyDenominatedOriginalAmount	,
    this.parts	,
    this.partnerPayload	,
    this.dispensableAmount	,
    this.userModified	});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(

        accountId: json['accountId'],
        amount: json['amount'],
        categoryId: json['categoryId'],
        categoryType: json['categoryType'],
        credentialsId: json['credentialsId'],
        date: json['date'],
        description: json['description'],
        formattedDescription: json['formattedDescription'],
        id: json['id'],
        inserted: json['inserted'],
        internalPayload: json['internalPayload'],
        lastModified: json['lastModified'],
        merchantId: json['merchantId'],
        notes: json['notes'],
        originalAmount: json['originalAmount'],
        originalDate: json['originalDate'],
        originalDescription: json['originalDescription'],
        payload: json['payload'],
        MESSAGE: json['MESSAGE'],
        TRANSFER_ACCOUNT_NAME_EXTERNAL: json['TRANSFER_ACCOUNT_NAME_EXTERNAL'],
        DETAILS: json['DETAILS'],
        pending: json['pending'],
        timestamp: json['timestamp'],
        type: json['type'],
        userId: json['userId'],
        upcoming: json['upcoming'],
        userModifiedAmount: json['userModifiedAmount'],
        userModifiedCategory: json['userModifiedCategory'],
        userModifiedDate: json['userModifiedDate'],
        userModifiedDescription: json['userModifiedDescription'],
        userModifiedLocation: json['userModifiedLocation'],
        currencyDenominatedAmount: json['currencyDenominatedAmount'],
        unscaledValue: json['unscaledValue'],
        scale: json['scale'],
        currencyCode: json['currencyCode'],
        currencyDenominatedOriginalAmount: json['currencyDenominatedOriginalAmount'],
        parts: json['parts'],
        partnerPayload: json['partnerPayload'],
        dispensableAmount: json['dispensableAmount'],
        userModified: json['userModified'],
    );
  }
}

