class PaginationFilterHelper {
  late int page;
  late int items;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is PaginationFilterHelper && o.page == page && o.items == items;
  }

  @override
  int get hashCode {
    return page.hashCode ^ items.hashCode;
  }
}
