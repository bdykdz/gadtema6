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
  TypedReducer<AppState, GetImagesSuccessful>(_getImagesSuccesful).call,
]);

AppState _getImagesSuccesful(AppState state, GetImagesSuccessful action) {
  return state.copyWith(images: <Picture>[...state.images, ...action.images]);
}
