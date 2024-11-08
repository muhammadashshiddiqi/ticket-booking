import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_booking_app/pages/home-page/home_page_logic.dart';

class ScanPageLogic extends FViewLogic {
  HomePageLogic parentLogic;
  FPageTransitionHolder? transitionHolder;
  BuildContext get context => parentLogic.context;

  final MobileScannerController controller = MobileScannerController(autoStart: false);
  late final FPipe<bool> onCameraPipe = FPipe(initValue: false, disposer: disposer);
  late final FPipe<bool> onTorchPipe = FPipe(initValue: false, disposer: disposer);

  ScanPageLogic({
    required this.parentLogic,
    required FDisposer disposer,
    this.transitionHolder,
  }) {
    onCameraPipe.update(false);
  }

  void onTapCamera() {
    controller.start();
    onCameraPipe.update(!onCameraPipe.value);
  }

  void onGetResult(Barcode? result) async {
    controller.stop();
    onCameraPipe.update(false);

    print('QR CODE : ${result?.rawValue ?? ''}');
    return;
  }

  void onTapFlash() {
    controller.toggleTorch();
    onTorchPipe.update(!onTorchPipe.value);
  }
}
