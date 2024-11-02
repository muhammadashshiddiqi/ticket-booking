import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/event-page/detail/detail_event_page.dart';

class DetailEventPageLogic extends FPageLogic<DetailEventPage> {
  FPageTransitionHolder? transitionHolder;

  late final FPipe<String> inputNamePipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<String> inputLocationPipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<String> datePipe = FPipe(initValue: '', disposer: disposer);

  DetailEventPageLogic(this.transitionHolder) {
    inputNamePipe.update('Sholat Shubuh Gabungan');
    inputLocationPipe.update('Masjid Al Istiqomah');
    datePipe.update('2024-10-26 15:57:18');
  }

  void onTapBuy() {}
}
