class FindDeputyExpensesByYearSupport {
  late int year;
  late int deputyId;

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is FindDeputyExpensesByYearSupport &&
        o.year == year &&
        o.deputyId == deputyId;
  }

  @override
  int get hashCode {
    return year.hashCode ^ deputyId.hashCode;
  }
}
