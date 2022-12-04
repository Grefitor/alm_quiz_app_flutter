import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ErrorDialog extends StatelessWidget {
  final String error;

  const ErrorDialog._( this.error, {Key? key}) : super(key: key);

  static Future<void> show(BuildContext context, String errorMessage) {
    return showCupertinoDialog(context: context, builder: (_) {
      return ErrorDialog._(errorMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Actions'),
      actions: [
        CupertinoDialogAction(child: const Text('okay'), onPressed: () {
          Navigator.of(context).pop();
        },)
      ],
    );
  }
}

class LoadingSheet extends StatelessWidget {
  const LoadingSheet._({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(48)
          )
        ),
        context: context, builder: (_) => const LoadingSheet._());
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.blueGrey.shade700, size: 80),
      ),
    );
  }
}
