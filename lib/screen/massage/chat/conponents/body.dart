import 'package:flutter/material.dart';
import 'package:rmfilter/classifier.dart';

class Body extends StatefulWidget {
  final String body;
  Body(this.body);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.body,
              style: TextStyle(fontSize: 16),
            ),
          ),
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.sync_sharp,
                  size: 35,
                ),
                onPressed: () {
                  final text = widget.body;
                  final prediction = _classifier.classify(text);
                  setState(
                    () {
                      predicState(text, prediction);
                      _controller.clear();
                    },
                  );
                },
              ),
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
                  setState(
                    () {
                      predicState(text, prediction);
                      _controller.clear();
                    },
                  );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  predicState(String text, List<double> prediction) {
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
              Text(
                "   Positive: ${prediction[1].toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "   Negative: ${prediction[0].toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
