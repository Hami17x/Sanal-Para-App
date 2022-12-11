class BankModel {
  String? bankName;
  String? bankIban;
  String? bankAccountName;
  String? descriptionNo;

  BankModel(
      {this.bankName, this.bankIban, this.bankAccountName, this.descriptionNo});

  BankModel.fromJson(Map<String, dynamic> json) {
    bankName = json['bankName'];
    bankIban = json['bankIban'];
    bankAccountName = json['bankAccountName'];
    descriptionNo = json['descriptionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankName'] = bankName;
    data['bankIban'] = bankIban;
    data['bankAccountName'] = bankAccountName;
    data['descriptionNo'] = descriptionNo;
    return data;
  }
}
