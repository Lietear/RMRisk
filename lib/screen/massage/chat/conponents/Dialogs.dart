import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart';

import '../../body_screen.dart';

class Dialogs {
  _confirmResult(bool isYes, BuildContext context, int id, int threadId) async {
    if (isYes) {
      SmsRemover smsRemover = SmsRemover();
      await smsRemover.removeSmsById(id, threadId);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }

  infomation(BuildContext context, String title, String description, int id,
      int threadId) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(description)],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => _confirmResult(false, context, id, threadId),
              child: Text("Cancel"),
            ),
            FlatButton(
              onPressed: () => _confirmResult(true, context, id, threadId),
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }
}
