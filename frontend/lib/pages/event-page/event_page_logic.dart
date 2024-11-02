import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/event-page/detail/detail_event_page.dart';
import 'package:ticket_booking_app/pages/event-page/input/input_event_page.dart';
import 'package:ticket_booking_app/pages/home-page/home_page_logic.dart';

class EventPageLogic extends FViewLogic {
  HomePageLogic parentLogic;
  FPageTransitionHolder? transitionHolder;
  BuildContext get context => parentLogic.context;

  EventPageLogic({
    required this.parentLogic,
    required FDisposer disposer,
    this.transitionHolder,
  });

  
  void onTapDetail() async {
    await parentLogic.pageOpen(
      DetailEventPage(transitionHolder),
      getTransitionHolder: (holder) {
        holder.animationEnabled = false;
        holder.withMatchingBuilder = false;
      },
    );
  }
  

  void onTapAdd() async {
    await parentLogic.pageOpen(
      InputEventPage(transitionHolder),
      getTransitionHolder: (holder) {
        holder.animationEnabled = false;
        holder.withMatchingBuilder = false;
      },
    );
  }
}
