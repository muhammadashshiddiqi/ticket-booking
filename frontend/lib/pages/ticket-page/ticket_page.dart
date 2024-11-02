import 'package:flutter/material.dart';
import 'package:ticket_booking_app/pages/home-page/home_page.dart';
import 'package:ticket_booking_app/pages/ticket-page/ticket_page_logic.dart';

extension TicketPage on HomePage {
  Widget ticketPage(TicketPageLogic logic) {
    return Expanded(
      child: Container(color: Colors.lime),
    );
  }
}
