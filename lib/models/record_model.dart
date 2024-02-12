import 'dart:convert';
import 'dart:math';

class RecordModel {
  RecordModel(
      {required this.type,
      required this.subType,
      required this.description,
      required this.amount,
      required this.currency});

  final String id  = _generateId();
  final String type;
  final String subType;
  final String description;
  final double amount;
  final String currency;
  final DateTime lastUpdated = DateTime.now();

  static String _generateId() {
    var random = Random.secure();
    var values = List<int>.generate(16, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'subType': subType,
      'description': description,
      'amount': amount,
      'currency': currency,
      'lastUpdated': lastUpdated.toString(),
    };
  }

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
        type: json['type'] as String,
        subType: json['subType'] as String,
        description: json['description'] as String,
        amount: json['amount'] as double,
        currency: json['currency'] as String);
  }
}
