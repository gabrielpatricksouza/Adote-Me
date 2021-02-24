import 'package:adote_me/View/About/aboutScreen.dart';
import 'package:adote_me/View/Home/homeScreen.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomeClickedEvent,
  AboutClickedEvent,
  // UtilityClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({this.onMenuTap});

  @override
  NavigationStates get initialState => HomeScreen(
    onMenuTap: onMenuTap,
  );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield HomeScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.AboutClickedEvent:
        yield AboutPage(
          onMenuTap: onMenuTap,
        );
        break;
      // case NavigationEvents.UtilityClickedEvent:
      //   yield UtilityBillsPage(
      //     onMenuTap: onMenuTap,
      //   );
        break;
    }
  }
}