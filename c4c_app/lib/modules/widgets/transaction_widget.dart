import 'package:c4c_app/modules/materials/transaction_style.dart';
import 'package:c4c_app/modules/models/similar_transaction.dart';
import 'package:c4c_app/modules/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

final token = '';

class HomeTransaction extends StatelessWidget {
  final Future<Transaction> futureTransaction;
  final String title;

  HomeTransaction({this.title, this.futureTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(

          color: Colors.white30,
          //Color.fromRGBO(64, 75, 96, .9),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1.0,
            )
          ]),
      child: Row(
        children: <Widget>[
          Radio(),
          Flexible(
            child: FutureBuilder<Transaction>(
              future: futureTransaction,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 8, // takes 80% of available width
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.description,
// Cuts of the text and shows ...
                                  overflow: TextOverflow.ellipsis,
                                  style: transactionDetails,
                                ),
                                Text(
                                  snapshot.data.amount.toString(),
                                  style: transactionDetails,
                                ),
                                Text(
                                  DateTime.fromMillisecondsSinceEpoch(
                                              snapshot.data.date)
                                          .day
                                          .toString() +
                                      "/" +
                                      DateTime.fromMillisecondsSinceEpoch(
                                              snapshot.data.date)
                                          .month
                                          .toString() +
                                      "/" +
                                      DateTime.fromMillisecondsSinceEpoch(
                                              snapshot.data.date)
                                          .year
                                          .toString(),
                                  style: transactionDetails,
                                ),
                              ]),
                        ),
                        Expanded(
                            flex: 2, // takes 20% of available width
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                FloatingActionButton(
                                  heroTag: null,
                                  child: Icon(Icons.chevron_right, size: 25),
                                  backgroundColor: Colors.amber,
                                  mini: true,
                                  onPressed: () {
                                    Future<SimilarTransactions> similarTransactions =
                                    fetchSimilarTransactions(snapshot.data.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SimilarTransactionScreen(
                                                  snapshot.data.description,
                                                  similarTransactions)),
                                    );
                                  },
                                )
                              ],
                            )),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarTransactionScreen extends StatelessWidget {
  final String transactionID;
  final Future<SimilarTransactions> similarTransactions;

  SimilarTransactionScreen(this.transactionID, this.similarTransactions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text("Similar Transactions"),
        ),
        body: FutureBuilder<SimilarTransactions>(
            future: similarTransactions,
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Text("${snapshot.error}");
              }
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              if (snapshot.hasData) {
                List<Transaction> similarTransactions = [];
                List<Transaction> transactions = snapshot.data.transactions;
                for (var transaction in transactions) {
                  if (transactionID == transaction.description) {
                    print(
                        identical(transaction.description, transaction.amount));
                    similarTransactions.add(transaction);
                  }
                }
                return ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: similarTransactions.length,
                    itemBuilder: (BuildContext context, index) {
                      return new ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        title: Container(
                            margin: new EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 1.0),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(7.0),
                                    topRight: const Radius.circular(7.0),
                                    bottomLeft: const Radius.circular(7.0),
                                    bottomRight: const Radius.circular(7.0))),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    similarTransactions[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(children: <Widget>[
                                    Icon(Icons.euro_symbol,
                                        color: Colors.white),
                                    Text(
                                      similarTransactions[index]
                                          .amount
                                          .toString(),
                                    ),
                                  ]),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.date_range,
                                          color: Colors.white),
                                      Text(
                                        DateTime.fromMillisecondsSinceEpoch(
                                                    similarTransactions[index]
                                                        .date)
                                                .day
                                                .toString() +
                                            "/" +
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    similarTransactions[index]
                                                        .date)
                                                .month
                                                .toString() +
                                            "/" +
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    similarTransactions[index]
                                                        .date)
                                                .year
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                ])),
                      );
                    });
              }
            }));
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
          const SizedBox(height: 20),
          RaisedButton(
            onPressed: () => fetchTransaction(10),
            child:
                const Text('Other Transactions', style: TextStyle(fontSize: 20)),
          ),
          trans(10),
        ],
      ),
    );
  }
}

Future<SimilarTransactions> fetchSimilarTransactions(
    String transactionId) async {
  final response = await http.get(
    'https://api.tink.com/api/v1/transactions/'+transactionId+'/similar',
    headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseJson = json.decode(response.body);
    return SimilarTransactions.fromJson(responseJson);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Failed to load transactions ' + response.statusCode.toString());
  }
}

Future<Transaction> fetchTransaction(int index) async {
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
    throw Exception(
        'Failed to load transactions ' + response.statusCode.toString());
  }
}