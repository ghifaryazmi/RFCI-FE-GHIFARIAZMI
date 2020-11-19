import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleApp/bloc/undo_bloc.dart';
import 'package:simpleApp/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Widget",
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (_) => UndoBloc()),
        ], child: Home()),
        theme: ThemeData(
            primaryColor: Colors.pink,
            accentColor: Colors.orange,
            buttonTheme: ButtonThemeData(buttonColor: Color(0xFFaabbcc))));
  }
}
