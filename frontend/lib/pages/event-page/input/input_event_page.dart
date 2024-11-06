import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:fstudio/widget/column_expanded_scroll.dart';
import 'package:ticket_booking_app/pages/event-page/input/input_event_page_logic.dart';

class InputEventPage extends FPage<InputEventPageLogic> {
  FPageTransitionHolder? transitionHolder;

  InputEventPage(this.transitionHolder);

  @override
  void initialize() {
    setLogic(InputEventPageLogic(transitionHolder));
  }

  @override
  Widget buildLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _view(context),
          ],
        ),
      ),
    );
  }

  Widget _view(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          header(),
          FColumnExpandedScroll(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              logic.inputNamePipe.onUpdate((_) {
                return TextField(
                  controller: logic.inputNamePipe.textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter name event',
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
                'Location',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              logic.inputLocationPipe.onUpdate((_) {
                return TextField(
                  controller: logic.inputLocationPipe.textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter location event',
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
                'Date',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              logic.datePipe.onUpdate((date) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(width: 1.5, color: Colors.grey.shade300),
                  ),
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  child: InkWell(
                    onTap: logic.pageBack,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Text(
                        date.isEmpty ? 'Choose date' : date,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: date.isEmpty ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            color: Colors.transparent,
            margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: InkWell(
              onTap: logic.pageBack,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.indigo.shade100,
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
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
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Create Event',
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
