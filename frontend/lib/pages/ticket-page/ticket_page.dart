import 'package:flutter/material.dart';
import 'package:fstudio/widget/column_expanded_scroll.dart';
import 'package:ticket_booking_app/pages/home-page/home_page.dart';
import 'package:ticket_booking_app/pages/ticket-page/ticket_page_logic.dart';

extension TicketPage on HomePage {
  Widget ticketPage(TicketPageLogic logic) {
    return Expanded(
      child: Column(
        children: [
          header(),
          FColumnExpandedScroll(
            children: [
              _item(logic),
              _item(logic),
            ],
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 32, left: 32),
      child: Row(
        children: [
          Card(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            color: Colors.transparent,
            child: InkWell(
              onTap: logic.pageBack,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'My Ticket',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(TicketPageLogic logic) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.grey),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Testting Event 1 | Jakarta',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2024-03-02 21:00:00',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Available',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
