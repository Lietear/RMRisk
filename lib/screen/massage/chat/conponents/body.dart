import 'package:flutter/material.dart';
import 'package:rmfilter/classifier.dart';
import 'package:rmfilter/constants.dart';

class Body extends StatefulWidget {
  final String body;
  Body(this.body);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Body body;
  late TextEditingController _controller;
  late Classifier _classifier;
  late List<Widget> _children;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _classifier = Classifier();
    _children = [];
    _children.add(Container());
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _children.length,
              itemBuilder: (_, index) {
                return _children[index];
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: kPrimaryColor)),
            child: Row(children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Type message'),
                  controller: _controller,
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final text = _controller.text;
                  final prediction = _classifier.classify(text);
                  setState(() {
                    _children.add(Dismissible(
                      key: GlobalKey(),
                      onDismissed: (direction) {},
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: prediction[1] > prediction[0]
                              ? Colors.lightGreen
                              : Colors.redAccent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "$text",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text("Prediction:"),
                              Text("   Positive: ${prediction[1]}"),
                              Text("   Negative: ${prediction[0]}"),
                            ],
                          ),
                        ),
                      ),
                    ));
                    _controller.clear();
                  });
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
