import 'package:redux/redux.dart';
import './state/index.dart';
import './reducer/index.dart';
import '../utils/sharedPreferences.dart';
import './state/app.dart';
import './state/storage.dart';
import 'persistor.dart';

Store store;

initStore () async {
  await initSharedPreferences(); // 实例化一个sharedPreferences
  Persistor storagePersistor = Persistor<StorageState>('storage', JsonSerializer<StorageState>(StorageState.fromJson));
  StorageState storageState = storagePersistor.getState();
  GlobalState globalState = GlobalState(app: AppState(), storage: storageState);
  store = Store<GlobalState>(getReducers, initialState: globalState, middleware: [storagePersistor.middleware(storageState.toJson)]);
  return store;
}
