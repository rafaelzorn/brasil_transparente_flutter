class ExpenseModel {
  int? documentCode;
  int? month;
  double? documentValue;
  double? totalValueMonth;
  String? providerName;
  String? documentDate;
  String? expenseType;

  ExpenseModel({
    this.documentCode,
    this.month,
    this.documentValue,
    this.totalValueMonth,
    this.providerName,
    this.documentDate,
    this.expenseType,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      documentCode: map['codDocumento'],
      month: map['mes'],
      documentValue: map['valorDocumento'],
      totalValueMonth: map['valor_total_mes'],
      providerName: map['nomeFornecedor'],
      documentDate: map['dataDocumento'],
      expenseType: map['tipoDespesa'],
    );
  }
}
