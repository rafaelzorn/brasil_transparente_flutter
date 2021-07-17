class FindDeputiesSupport {
  late int page;
  late int items;
  late Map<String, String> filters;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is FindDeputiesSupport &&
        o.page == page &&
        o.items == items &&
        o.filters == filters;
  }

  @override
  int get hashCode {
    return page.hashCode ^ items.hashCode ^ filters.hashCode;
  }
}
