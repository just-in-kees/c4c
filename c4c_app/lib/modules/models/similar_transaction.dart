import 'package:c4c_app/modules/models/transaction.dart';

class SimilarTransactions {
  List<Statistics> statistics;
  List<Transaction> transactions;

  SimilarTransactions({this.statistics, this.transactions});

  SimilarTransactions.fromJson(Map<String, dynamic> json) {
    if (json['statistics'] != null) {
      statistics = new List<Statistics>();
      json['statistics'].forEach((v) { statistics.add(new Statistics.fromJson(v)); });
    }
    if (json['transactions'] != null) {
      transactions = new List<Transaction>();
      json['transactions'].forEach((v) { transactions.add(new Transaction.fromJson(v)); });
    }
  }
}
class Statistics {
  final String description;
  final String payload;
  final String period;
  final String resolution;
  final String type;
  final String userId;
  final num value;

  Statistics(
      {this.description,
      this.payload,
      this.period,
      this.resolution,
      this.type,
      this.userId,
      this.value});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      description: json['description'],
      payload: json['payload'],
      period: json['period'],
      resolution: json['resolution'],
      type: json['type'],
      userId: json['userId'],
      value: json['value'],
    );
  }
}
