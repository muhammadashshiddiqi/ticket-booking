import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/register-page/register_page.dart';

class RegisterPageLogic extends FPageLogic<RegisterPage> {
  FPageTransitionHolder? transitionHolder;

  late final FPipe<String> userNamePipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<String> passwordPipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<bool> showPipe = FPipe(initValue: false, disposer: disposer);

  RegisterPageLogic(this.transitionHolder);

  void onTapShowPassword() {
    showPipe.update(!showPipe.value);
  }
}
