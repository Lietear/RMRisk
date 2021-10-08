import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart';
import 'dart:async';
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

  seachheader() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 110, // Set this height
      flexibleSpace: Container(
        color: Colors.blue,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            SizedBox(width: 15),
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
            Text("Message", style: TextStyle(fontSize: 23, color: Colors.white))
          ]),
          SizedBox(height: 8),
          Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    hintStyle: new TextStyle(color: Colors.black38),
                    hintText: "Search"),
              )),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: seachheader(),
      body: FutureBuilder(
        future: fetchSMS(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              String type = "NONE";
              if (messages[index].kind == SmsMessageKind.Received) {
                type = "Inbox";
              } else if (messages[index].kind == SmsMessageKind.Sent) {
                type = "Sent";
              } else if (messages[index].kind == SmsMessageKind.Draft) {
                type = "Draft";
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          messages[index].address + "(" + type + ")",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          messages[index].date.toString() +
                              "\n" +
                              messages[index].body,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatSCreen(
                            messages[index].address.toString(),
                            messages[index].body.toString(),
                            messages[index].id,
                            messages[index].threadId),
                      ),
                    );
                  },
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
