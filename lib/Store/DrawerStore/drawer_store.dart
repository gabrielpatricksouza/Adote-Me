import 'package:mobx/mobx.dart';
part 'drawer_store.g.dart';

class DrawerStore = _DrawerStore with _$DrawerStore;

abstract class _DrawerStore with Store{

  @observable
  int numWidget = 0;

  @action
  int setNumWidget (int num) {
    numWidget = num;
    print("object");
    print(numWidget);
  }

}
