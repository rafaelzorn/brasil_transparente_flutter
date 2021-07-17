class FindDeputiesSupport {
  late int page;
  late int items;
  late String name;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is FindDeputiesSupport &&
        o.page == page &&
        o.items == items &&
        o.name == name;
  }

  @override
  int get hashCode {
    return page.hashCode ^ items.hashCode ^ name.hashCode;
  }
}
