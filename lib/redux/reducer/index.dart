import './app.dart';
import './storage.dart';
import '../state/index.dart';

GlobalState getReducers(GlobalState state, action) {
  return GlobalState(
    app: appReducer(state.app, action),
    storage: storageReducer(state.storage, action)
  );
}