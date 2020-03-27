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


class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.orange : null
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C4C transaction classifier'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
                context: context,
                tiles: tiles,
          )
          .toList();

          var tinkLinkPart1 = "https://link.tink.com/1.0/authorize/?client_id=";
          var clientID = "clientID goes here";
          var tinkLinkPart2 = "&redirect_uri=https%3A%2F%2Fconsole.tink.com%2Fcallback&scope=accounts:read,investments:read,transactions:read,user:read&market=NL&locale=en_US&input_provider=nl-ing-ob";
          var tinkLink = tinkLinkPart1 + clientID + tinkLinkPart2;




          return Scaffold(
            appBar: AppBar(
              title: Text('Authentication iFrame'),
            ),
//            body: ListView(children: divided),

            body: Container(

                child: WebView(

                initialUrl: Uri.dataFromString('<html><body><iframe src=$tinkLink ></iframe></body><script type="text/javascript">window.extents.postMessage(document.body.offsetHeight);</script></html>', mimeType: 'text/html').toString(),
                  javascriptMode: JavascriptMode.unrestricted,

                ),

            )
          );
        },
      ),
    );
  }

}


Future<Transaction> fetchTransaction() async {

  final token = 'BEARER TOKEN HERE';

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
    return Transaction.fromJson(responseJson[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load transactions ' + response.statusCode.toString() );
  }
}



class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}


class _MyAppState extends State<MyApp> {
  Future<Transaction> futureTransaction;

  @override
  void initState() {
    super.initState();
    futureTransaction = fetchTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Transaction>(
            future: futureTransaction,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.description);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
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

