import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{

  @observable
  bool isDrawerOpen = false;

  @observable
  double xOffset = 0;

  @observable
  double yOffset = 0;

  @observable
  double scaleFactor = 1;

  @action
  void menuOff(){
    xOffset=0;
    yOffset=0;
    scaleFactor=1;
    isDrawerOpen=false;
  }

  @action
  void menuOn(){
    xOffset = 230;
    yOffset = 150;
    scaleFactor = 0.6;
    isDrawerOpen=true;
  }
}
