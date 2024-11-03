import 'package:fstudio/fstudio.dart';
import 'package:ticket_booking_app/pages/login-page/login_page.dart';
import 'package:ticket_booking_app/pages/register-page/register_page.dart';

class LoginPageLogic extends FPageLogic<LoginPage> {
  FPageTransitionHolder? transitionHolder;

  late final FPipe<String> userNamePipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<String> passwordPipe = FPipe(initValue: '', disposer: disposer, withTextEditingController: true, withErrPipe: true);
  late final FPipe<bool> showPipe = FPipe(initValue: false, disposer: disposer);

  LoginPageLogic(this.transitionHolder);

  void onTapShowPassword() {
    showPipe.update(!showPipe.value);
  }

  void onTapRegister() async {
    await pageOpen(
      RegisterPage(transitionHolder),
      getTransitionHolder: (holder) {
        holder.animationEnabled = false;
        holder.withMatchingBuilder = false;
      },
    );
  }
}
