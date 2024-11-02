import 'package:flutter/material.dart';
import 'package:ticket_booking_app/pages/home-page/home_page.dart';
import 'package:ticket_booking_app/pages/settings-page/settings_page_logic.dart';

extension SettingsPage on HomePage {
  Widget settingsPage(SettingsPageLogic logic) {
    return Expanded(
      child: Container(color: Colors.indigo),
    );
  }
}
