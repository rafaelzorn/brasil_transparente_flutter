class FindPropositionsSupport {
  late int page;
  late int items;
  late int year;
  late int deputyId;

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is FindPropositionsSupport &&
        o.page == page &&
        o.items == items &&
        o.year == year &&
        o.deputyId == deputyId;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        items.hashCode ^
        deputyId.hashCode ^
        deputyId.hashCode;
  }
}
