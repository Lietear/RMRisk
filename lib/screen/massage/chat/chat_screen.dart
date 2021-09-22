import 'package:flutter/material.dart';
import 'package:rmfilter/constants.dart';
import 'package:rmfilter/screen/massage/chat/conponents/body.dart';

class ChatSCreen extends StatelessWidget {
  String address;
  String body;
  ChatSCreen(this.address, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Body(body),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Row(children: [
        Column(
          children: [Text(address)],
        )
      ]),
    );
  }
}
