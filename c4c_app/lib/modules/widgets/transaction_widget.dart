import 'package:c4c_app/modules/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';


class HomeTransaction extends StatelessWidget {
  final Future<Transaction> futureTransaction;
  final String title;

  HomeTransaction({this.title, this.futureTransaction});
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
          Flexible(
            child: FutureBuilder<Transaction>(
              future: futureTransaction,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                          DateTime.fromMillisecondsSinceEpoch(snapshot.data.date).day.toString()
                            + "/" + DateTime.fromMillisecondsSinceEpoch(snapshot.data.date).month.toString()
                            + "/" + DateTime.fromMillisecondsSinceEpoch(snapshot.data.date).year.toString(),
                          style: transactionDetails,
                        )
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

Future<Transaction> fetchTransaction(int index) async {

  final token = '';

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

