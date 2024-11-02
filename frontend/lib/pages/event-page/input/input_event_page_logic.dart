import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/event-page/input/input_event_page.dart';

class InputEventPageLogic extends FPageLogic<InputEventPage> {
  FPageTransitionHolder? transitionHolder;

  late final FPipe<String> inputNamePipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<String> inputLocationPipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<String> datePipe = FPipe(initValue: '', disposer: disposer);

  InputEventPageLogic(this.transitionHolder);
}
