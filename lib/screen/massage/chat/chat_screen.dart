import 'package:flutter/material.dart';
import 'package:rmfilter/screen/massage/chat/conponents/body.dart';
import 'package:sms_maintained/sms.dart';
import 'package:rmfilter/screen/massage/chat/conponents/Dialogs.dart';

class ChatSCreen extends StatelessWidget {
  String address;
  String body;
  int id;
  int threadId;
  ChatSCreen(this.address, this.body, this.id, this.threadId);

  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: Body(body),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(children: [
        Row(
          children: [
            Text(address),
            SizedBox(
              width: 208,
            ),
            IconButton(
              onPressed: () {
                dialogs.infomation(context, "Are you sure?",
                    "before remove you can't recovery this Sms", id, threadId);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        )
      ]),
    );
  }
}
