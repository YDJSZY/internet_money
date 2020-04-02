import '../action/app.dart';
import '../state/app.dart';

AppState appReducer(AppState state, dynamic action) {
  switch (action['type']) {
    case AppActions.SetLanguageFile:
      state.lang = action['data'];
      return state;

    default:
      return state;
  }
}