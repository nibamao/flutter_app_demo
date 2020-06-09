
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.start: _start,
      IndexAction.success: _success,
      IndexAction.error: _error,
      IndexAction.complete: _complete,
    },
  );
}

IndexState _start(IndexState state, Action action) {
  println('请求开始回调');
  IndexState newState = state.clone();
  return newState;
}

IndexState _success(IndexState state, Action action) {
  println("请求成功回调刷新页面");
  final IndexState newState = state.clone();
  newState.list = action.payload;
  newState.list.forEach((item) {
    println(item.title);
  });
  return newState;
}

IndexState _error(IndexState state, Action action) {
  println('请求失败回调' + action.payload);
  IndexState newState = state.clone();
  return newState;
}

IndexState _complete(IndexState state, Action action) {
  println('请求结束回调');
  IndexState newState = state.clone();
  return newState;
}
