import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import '../actions/index.dart';
import '../models/index.dart';

AppState reducer(AppState state, dynamic action) {
  if (kDebugMode) {
    print(action);
  }

  return _reducer(state, action);
}

Reducer<AppState> _reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetImagesStart>(_getImagesStart).call,
  TypedReducer<AppState, GetImagesSuccessful>(_getImagesSuccesful).call,
  TypedReducer<AppState, GetImagesError>(_getImagesError).call,
]);

AppState _getImagesStart(AppState state, GetImagesStart action) {
  return state.copyWith(isLoading: true);
}

AppState _getImagesSuccesful(AppState state, GetImagesSuccessful action) {
  return state.copyWith(
      isLoading: false,
      hasMore: action.images.isNotEmpty,
      page: state.page + 1,
      images: <Picture>[...state.images, ...action.images]);
}

AppState _getImagesError(AppState state, GetImagesError action) {
  return state.copyWith(isLoading: false);
}
