import 'package:baselibrary/network/dio_api.dart';
import 'package:baselibrary/network/http_api.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutterappdemo/constans/router.dart';
import 'package:flutterappdemo/entity/entity_factory.dart';
import 'package:flutterappdemo/entity/news_entity.dart';

import 'action.dart';
import 'state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    IndexAction.request: _request,
  });
}

void _request(Action action, Context<IndexState> ctx) {
  Map<String, String> params = Map();
  params["title"] = "";
  params["lang"] = "zh-cn";
  Navigator.of(ctx.context).pushNamed(RouterPath.second, arguments: null);
  DioApi.instance.asyncRequestNetwork<NewsEntity>(
      Method.get, HttpApi.GET_NEWS + "/1/20", onStart: () {
    println('请求开始');
    ctx.dispatch(IndexActionCreator.onStart());
  }, onSuccessList: (List<dynamic> list) {
    List<NewsEntity> newsEntities = new List();
    list.forEach((item) {
      newsEntities.add(EntityFactory.generateOBJ(item));
    });
    println('请求成功');
    ctx.dispatch(IndexActionCreator.onSuccess(newsEntities));
  }, onError: (int code, String msg) {
    println('请求报错 code:$code msg:$msg');
    ctx.dispatch(IndexActionCreator.onError(msg));
  }, onDone: () {
    ctx.dispatch(IndexActionCreator.onComplete());
  }, isList: true);
}
