import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget{
  const MyApp(
        {super.key}
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Random English Words")
        ),
        body: Center(
          child: RandomWords(),

        ),

      )
    );
  }

}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _GeneratedPairs = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return const Divider();
        final index = i ~/ 2;
        if(index >= _GeneratedPairs.length){
          _GeneratedPairs.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _GeneratedPairs[index].asPascalCase
          ),
        );
      },
    );
  }
}
