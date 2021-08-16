abstract class BaseRepository {
  bool isLastPage({required List links}) {
    return links.where((item) => item['rel'] == 'next').isEmpty;
  }
}
