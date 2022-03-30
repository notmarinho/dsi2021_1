import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PairEdit extends StatelessWidget {
  const PairEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pair = ModalRoute.of(context)?.settings.arguments as WordPair;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Palavra'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pair.first),
            Text(pair.second),
          ],
        ),
      ),
    );
  }
}
