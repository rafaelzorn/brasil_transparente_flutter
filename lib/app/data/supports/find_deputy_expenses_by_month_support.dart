class FindDeputyExpensesByMonthSupport {
  late int page;
  late int items;
  late int month;
  late int year;
  late int deputyId;

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is FindDeputyExpensesByMonthSupport &&
        o.page == page &&
        o.items == items &&
        o.month == month &&
        o.year == year &&
        o.deputyId == deputyId;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        items.hashCode ^
        month.hashCode ^
        year.hashCode ^
        deputyId.hashCode;
  }
}
