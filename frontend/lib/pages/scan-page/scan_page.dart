import 'package:flutter/material.dart';
import 'package:fstudio/widget/column_expanded_scroll.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_booking_app/pages/home-page/home_page.dart';
import 'package:ticket_booking_app/pages/scan-page/scan_page_logic.dart';

extension ScanPage on HomePage {
  Widget scanPage(ScanPageLogic logic) {
    return Expanded(
      child: Column(
        children: [
          header(logic),
          FColumnExpandedScroll(
            padding: const EdgeInsets.only(top: 32, bottom: 32, left: 24, right: 24),
            children: [
              const Text(
                'Please scan the QR code below to enter the event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              logic.onCameraPipe.onUpdate((isCamera) {
                if (isCamera) {
                  return SizedBox(
                    width: 300,
                    height: 300,
                    child: MobileScanner(
                      controller: logic.controller,
                      errorBuilder: (context, error, child) {
                        return const SizedBox();
                      },
                      onDetect: (barcodes) {
                        logic.onGetResult(barcodes.barcodes.firstOrNull);
                      },
                      fit: BoxFit.fill,
                    ),
                  );
                }

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  color: Colors.grey.shade300,
                  child: InkWell(
                    onTap: logic.onTapCamera,
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 300,
                      child: Text(
                        'On Tap This Open QR Code',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 32),
              logic.onTorchPipe.onUpdate((torchOn) {
                return Card(
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  color: Colors.grey.shade600,
                  child: InkWell(
                    onTap: logic.onTapFlash,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        torchOn ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget header(ScanPageLogic currentLogic) {
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
              onTap: () {
                logic.pageBack();
                currentLogic.controller.stop();
              },
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
            'Scan Ticket',
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
}
