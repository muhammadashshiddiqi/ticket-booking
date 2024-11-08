import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/event-page/event_page_logic.dart';
import 'package:ticket_booking_app/pages/home-page/home_page.dart';
import 'package:ticket_booking_app/pages/scan-page/scan_page_logic.dart';
import 'package:ticket_booking_app/pages/settings-page/settings_page_logic.dart';
import 'package:ticket_booking_app/pages/ticket-page/ticket_page_logic.dart';

class HomePageLogic extends FPageLogic<HomePage> {
  FPageTransitionHolder? transitionHolder;

  late final FPipe<int> activeBtnPipe = FPipe(initValue: 1, disposer: disposer);
  late SettingsPageLogic settingsPageLogic = SettingsPageLogic(parentLogic: this, disposer: disposer, transitionHolder: transitionHolder);
  late TicketPageLogic ticketPageLogic = TicketPageLogic(parentLogic: this, disposer: disposer, transitionHolder: transitionHolder);
  late ScanPageLogic scanPageLogic = ScanPageLogic(parentLogic: this, disposer: disposer, transitionHolder: transitionHolder);
  late EventPageLogic eventPageLogic = EventPageLogic(parentLogic: this, disposer: disposer, transitionHolder: transitionHolder);

  HomePageLogic(this.transitionHolder);

  void onTapMenu(int index) {
    scanPageLogic.controller.stop();
    scanPageLogic.onCameraPipe.update(false);

    activeBtnPipe.update(index);
  }
}
