
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:kisan/login/login_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Kisan App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Kisan App'),
        ),
        body: LoginInput(),
        )
      );
  }
}