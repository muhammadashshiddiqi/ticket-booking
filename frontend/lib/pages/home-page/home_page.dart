import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/event-page/event_page.dart';
import 'package:ticket_booking_app/pages/home-page/home_page_logic.dart';
import 'package:ticket_booking_app/pages/settings-page/settings_page.dart';
import 'package:ticket_booking_app/pages/ticket-page/ticket_page.dart';

class HomePage extends FPage<HomePageLogic> {
  FPageTransitionHolder? transitionHolder;

  HomePage(this.transitionHolder);

  @override
  void initialize() {
    setLogic(HomePageLogic(transitionHolder));
  }

  @override
  Widget buildLayout(BuildContext context) {
    return logic.activeBtnPipe.onUpdate((activeIndex) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _view(context),
              _btnNavigation(context),
            ],
          ),
        ),
      );
    });
  }

  Widget _btnNavigation(BuildContext context) {
    return logic.activeBtnPipe.onUpdate((activeView) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _itemBottom(
            title: 'Event',
            onTap: () => logic.onTapMenu(1),
            isActive: activeView == 1,
            icon: Icon(
              Icons.calendar_month_outlined,
              color: activeView == 1 ? Colors.white : Colors.black,
            ),
          ),
          _itemBottom(
            title: 'Ticket',
            onTap: () => logic.onTapMenu(2),
            isActive: activeView == 2,
            icon: Icon(
              Icons.confirmation_number_outlined,
              color: activeView == 2 ? Colors.white : Colors.black,
            ),
          ),
          _itemBottom(
            title: 'Settings',
            onTap: () => logic.onTapMenu(3),
            isActive: activeView == 3,
            icon: Icon(
              Icons.settings,
              color: activeView == 3 ? Colors.white : Colors.black,
            ),
          ),
        ],
      );
    });
  }

  Widget _itemBottom({
    required String title,
    required VoidCallback onTap,
    required Widget icon,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? Colors.indigo.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _view(BuildContext context) {
    return logic.activeBtnPipe.onUpdate((activeView) {
      Map<int, Widget> viewMap = {
        1: eventPage(logic.eventPageLogic),
        2: ticketPage(logic.ticketPageLogic),
        3: settingsPage(logic.settingsPageLogic),
      };

      return viewMap[activeView] ?? const SizedBox();
    });
  }
}
