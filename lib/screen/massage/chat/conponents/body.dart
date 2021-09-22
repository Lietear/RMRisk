import 'package:flutter/material.dart';
import 'package:rmfilter/constants.dart';
import 'chat_input.dart';

class Body extends StatelessWidget {
  String body;
  Body(this.body);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Card(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(body),
                  ),
                ),
              ),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
