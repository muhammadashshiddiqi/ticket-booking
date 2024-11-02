import 'package:flutter/material.dart';
import 'package:fstudio/widget/column_expanded_scroll.dart';
import 'package:ticket_booking_app/pages/event-page/event_page_logic.dart';
import 'package:ticket_booking_app/pages/home-page/home_page.dart';

extension EventPage on HomePage {
  Widget eventPage(EventPageLogic logic) {
    return Expanded(
      child: Column(
        children: [
          header(logic),
          FColumnExpandedScroll(
            children: [
              _eventItem(logic),
              _eventItem(logic),
            ],
          ),
        ],
      ),
    );
  }

  Widget header(EventPageLogic logic) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 32, left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Card(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: logic.onTapAdd,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eventItem(EventPageLogic logic) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Testting Event 1 | Jakarta',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: logic.onTapDetail,
                child: const Icon(Icons.keyboard_arrow_right_rounded),
              )
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.grey, thickness: 1),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sold : 1',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Entered : 1',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(double.infinity, 0),
              backgroundColor: Colors.indigo.shade200,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            onPressed: () {},
            child: const Text(
              'Buy Ticket',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
