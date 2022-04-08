import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsi2021_1/components/palavra_card.dart';
import 'package:flutter/material.dart';

class PairCollection extends StatefulWidget {
  const PairCollection({Key? key}) : super(key: key);

  @override
  State<PairCollection> createState() => _PairCollectionState();
}

class _PairCollectionState extends State<PairCollection> {
  final Stream<QuerySnapshot> _palavrasStream =
      FirebaseFirestore.instance.collection('palavras').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _palavrasStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) => PalavraCard(document))
              .toList(),
        );
      },
    );
  }
}
