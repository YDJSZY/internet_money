import '../action/storage.dart';
import '../state/storage.dart';

StorageState storageReducer(StorageState state, dynamic action) {
  switch (action['type']) {
    case StorageActions.SetLanguage:
      state.language = action['data'];
      break;
    case StorageActions.SetLogin:
      state.isLogin = action['data'];
      break;
    case StorageActions.SetUserInfo:
      state.userInfo = action['data'];
      state.isLogin = true;
      break;
    case StorageActions.SetLogout:
      state.userInfo = {};
      state.isLogin = false;
      break;
    default:
      return state;
  }
  return state;
}