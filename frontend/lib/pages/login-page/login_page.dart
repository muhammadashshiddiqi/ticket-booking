import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:fstudio/widget/column_expanded_scroll.dart';
import 'package:ticket_booking_app/pages/login-page/login_page_logic.dart';

class LoginPage extends FPage<LoginPageLogic> {
  FPageTransitionHolder? transitionHolder;

  LoginPage(this.transitionHolder);

  @override
  void initialize() {
    setLogic(LoginPageLogic(transitionHolder));
  }

  @override
  Widget buildLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FColumnExpandedScroll(
          withExpanded: false,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          padding: const EdgeInsets.only(top: 32, bottom: 32, left: 24, right: 24),
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'TICKET BOOKING APPS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Username',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            logic.userNamePipe.onUpdate((_) {
              return TextField(
                controller: logic.userNamePipe.textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter username',
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }),
            const SizedBox(height: 32),
            Text(
              'Password',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            logic.passwordPipe.onUpdate((_) {
              return logic.showPipe.onUpdate((showPass) {
                return TextField(
                  obscureText: showPass ? false : true,
                  controller: logic.passwordPipe.textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    labelStyle: const TextStyle(color: Colors.grey),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Card(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.transparent,
                      elevation: 0,
                      child: InkWell(
                        onTap: logic.onTapShowPassword,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(Icons.remove_red_eye_outlined, color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                  ),
                );
              });
            }),
            const SizedBox(height: 32),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias,
              color: Colors.indigo,
              elevation: 0,
              child: InkWell(
                onTap: logic.onTapShowPassword,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'SUBMIT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'OR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias,
              color: Colors.pinkAccent,
              elevation: 0,
              child: InkWell(
                onTap: logic.onTapRegister,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'REGISTER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
