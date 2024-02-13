class RecordModel {
  String? sId;
  String? type;
  String? reason;
  String? description;
  int? amount;
  String? currency;
  String? lastUpdated;

  RecordModel(
      {this.sId,
      this.type,
      this.reason,
      this.description,
      this.amount,
      this.currency,
      this.lastUpdated});

  RecordModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    reason = json['reason'];
    description = json['description'];
    amount = json['amount'];
    currency = json['currency'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['reason'] = this.reason;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}
