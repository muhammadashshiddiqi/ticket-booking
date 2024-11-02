import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/home-page/home_page_logic.dart';

class SettingsPageLogic extends FViewLogic {
  HomePageLogic parentLogic;
  FPageTransitionHolder? transitionHolder;
  BuildContext get context => parentLogic.context;

  SettingsPageLogic({
    required this.parentLogic,
    required FDisposer disposer,
    this.transitionHolder,
  });
}
