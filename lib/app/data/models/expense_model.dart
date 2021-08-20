class ExpenseModel {
  int? month;
  int? documentValue;
  double? totalValueMonth;

  ExpenseModel({
    this.month,
    this.documentValue,
    this.totalValueMonth,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      month: map['mes'],
      documentValue: map['valorDocumento'],
      totalValueMonth: map['valor_total_mes'],
    );
  }
}
