import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappdemo/entity/news_entity.dart';

class IndexState implements Cloneable<IndexState> {
  List<NewsEntity> list;

  IndexState({this.list});

  @override
  IndexState clone() {
    return IndexState()..list = list;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState(list: new List<NewsEntity>());
}
