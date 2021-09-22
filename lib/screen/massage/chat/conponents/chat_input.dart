import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'package:rmfilter/classifier.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({
    Key? key,
  }) : super(key: key);

  late TextEditingController _controller;
  late Classifier _classifier;

  void initState() {
    _controller = TextEditingController();
    _classifier = Classifier();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(Icons.shield_outlined, color: kPrimaryColor),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                        controller: _controller,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    IconButton(
                      onPressed: () {
                        final text = _controller.text;
                        final prediction = _classifier.classify(text);
                      },
                      icon: Icon(Icons.send),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
