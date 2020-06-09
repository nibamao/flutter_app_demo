import 'package:flutterappdemo/entity/news_entity.dart';

class EntityFactory {
  static S generateOBJ<S,T>(json) {
    if (S.toString() == "String") {
      return json.toString() as S;
    } else if (T.toString() == "Map<dynamic, dynamic>") {
      return json as S;
    } else {
      return _generateOBJ(json);
    }
  }

  static T _generateOBJ<T>(json) {
    switch (T.toString()) {
      case "NewsEntity":
        return NewsEntity.fromJson(json) as T;
    }
    return null;
  }
}
