import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'dart:async';
import 'package:rmfilter/constants.dart';
import 'package:rmfilter/screen/massage/chat/chat_screen.dart';

class Body extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return BodyState();
  }
}

class BodyState extends State {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> messages = [];
  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchSMS(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              String type = "NONE)";
              if (messages[index].kind == SmsMessageKind.Received) {
                type = "Inbox)";
              } else if (messages[index].kind == SmsMessageKind.Sent) {
                type = "Sent)";
              } else if (messages[index].kind == SmsMessageKind.Draft) {
                type = "Draft)";
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.markunread,
                      color: kPrimaryColor,
                    ),
                    title: Text(messages[index].address + "(" + type + ""),
                    subtitle: Text(
                      messages[index].date.toString() +
                          "\n" +
                          messages[index].body,
                      maxLines: 3,
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatSCreen(
                                  messages[index].address.toString(),
                                  messages[index].body.toString())));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  fetchSMS() async {
    messages = await query.querySms(
        kinds: [SmsQueryKind.Inbox, SmsQueryKind.Sent, SmsQueryKind.Draft]);
  }
}
