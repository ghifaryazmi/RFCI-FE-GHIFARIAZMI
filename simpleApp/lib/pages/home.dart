import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleApp/bloc/undo_bloc.dart';
import 'package:undo/undo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController input = new TextEditingController();
  String text = "";

  reverseStringUsingCodeUnits(String input) {
    setState(() {
      text = String.fromCharCodes(input.codeUnits.reversed);
      context.bloc<UndoBloc>().add(Increment(text));
    });
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Reverse App"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
                keyboardType: TextInputType.text,
                controller: input,
                decoration: InputDecoration(labelText: "Masukan text disini")),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Output Reverse : " + text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    reverseStringUsingCodeUnits(input.text);
                  },
                  child: Text(
                    "Reverse",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange,
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        input.clear();
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        context.bloc<UndoBloc>().redo();
                      });
                    },
                    child: Text(
                      "Undo/Redo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
