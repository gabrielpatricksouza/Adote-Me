import 'package:adote_me/View/About/aboutScreen.dart';
import 'package:adote_me/View/Donation/donatioScreen.dart';
import 'package:adote_me/View/Home/homeScreen.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomeClickedEvent,
  AboutClickedEvent,
  DonationClickedEvent
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
      case NavigationEvents.DonationClickedEvent:
        yield DonationPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}