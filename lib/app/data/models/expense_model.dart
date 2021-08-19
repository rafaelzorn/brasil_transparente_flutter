class ExpenseModel {
  String? month;
  int? documentValue;

  ExpenseModel({
    this.month,
    this.documentValue,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      month: map['mes'],
      documentValue: map['valorDocumento'],
    );
  }
}
