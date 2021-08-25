import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'dart:async';
import 'package:rmfilter/constants.dart';

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
        return ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.markunread,
                    color: kPrimaryColor,
                  ),
                  title: Text(messages[index].address),
                  subtitle: Text(
                    messages[index].body,
                    maxLines: 2,
                    style: TextStyle(),
                  ),
                ),
              );
            });
      },
    ));
  }

  fetchSMS() async {
    messages = await query.getAllSms;
  }
}
