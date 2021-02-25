import 'package:adote_me/Store/DonationStore/donation_store.dart';
import 'package:adote_me/Store/HomeStore/home_store.dart';
import 'package:mobx/mobx.dart';
part 'controller_donation.g.dart';

class ControllerDonation = _ControllerDonation with _$ControllerDonation;

abstract class _ControllerDonation with Store{

  final homeStore = HomeStore();

  final donationStore = DonationStore();
}
