class FindDeputyExpensesSupport {
  late int month;
  late int year;
  late int deputyId;

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is FindDeputyExpensesSupport &&
        o.month == month &&
        o.year == year &&
        o.deputyId == deputyId;
  }

  @override
  int get hashCode {
    return month.hashCode ^ year.hashCode ^ deputyId.hashCode;
  }
}
