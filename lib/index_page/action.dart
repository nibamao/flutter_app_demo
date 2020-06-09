import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappdemo/entity/news_entity.dart';

//TODO replace with your own action
enum IndexAction { request, start, success, error, complete }

class IndexActionCreator {
  static Action onRequest() {
    return Action(IndexAction.request);
  }

  static Action onStart() {
    return Action(IndexAction.start);
  }

  static Action onSuccess(List<NewsEntity> list) {
    return Action(IndexAction.success, payload: list);
  }

  static Action onError(String errorMsg) {
    return Action(IndexAction.error, payload: errorMsg);
  }

  static Action onComplete() {
    return Action(IndexAction.complete);
  }
}
