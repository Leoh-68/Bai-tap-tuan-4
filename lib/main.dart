import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Máy tính',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(title: 'Máy tính'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _Controller = TextEditingController();
  late Function callback;
  int Text1 = 0;
  int Text2 = 0;
  String His = "";
  String TextDis = "0";
  Row _buildButtonRow(String label, double fSize, Color mau) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: TextButton(
              onPressed: () {
                if (label == "C") {
                  Text1 = 0;
                  Text2 = 0;
                  His = "";
                  TextDis = "0";
                } else if (label == "CE") {
                  Text1 = 0;
                  Text2 = 0;
                  His = "";
                  TextDis = "0";
                } else if (label == "+" ||
                    label == "-" ||
                    label == "*" ||
                    label == "/") {
                  His = TextDis + label;
                } else if (label == "+/-") {
                  TextDis = (double.parse(TextDis) * -1).toString();
                } else if (label == ",") {
                  if (TextDis.contains('.') == true) {
                    return;
                  }
                  TextDis += ".";
                } else if (label == "<=") {
                  TextDis = TextDis.substring(0, TextDis.length - 1);
                } else {
                  TextDis = TextDis + label;
                }
                setState(() {});
              },
              child:
                  Text(label, style: TextStyle(fontSize: fSize, color: mau))),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.lightBlue[900],
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 12, 50, 0),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: const Alignment(1, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              His,
                              style:
                                  TextStyle(fontSize: 48, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              TextDis,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButtonRow('CE', 24, Colors.white),
                    _buildButtonRow('C', 24, Colors.white),
                    _buildButtonRow('<=', 24, Colors.white),
                    _buildButtonRow('/', 24, Colors.white)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButtonRow('1', 24, Colors.white),
                    _buildButtonRow('2', 24, Colors.white),
                    _buildButtonRow('3', 24, Colors.white),
                    _buildButtonRow('x', 24, Colors.white)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButtonRow('4', 24, Colors.white),
                    _buildButtonRow('5', 24, Colors.white),
                    _buildButtonRow('6', 24, Colors.white),
                    _buildButtonRow('-', 24, Colors.white)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButtonRow('1', 24, Colors.white),
                    _buildButtonRow('2', 24, Colors.white),
                    _buildButtonRow('3', 24, Colors.white),
                    _buildButtonRow('+', 24, Colors.white)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButtonRow('+/-', 24, Colors.white),
                    _buildButtonRow('0', 24, Colors.white),
                    _buildButtonRow(',', 24, Colors.white),
                    _buildButtonRow('=', 24, Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
