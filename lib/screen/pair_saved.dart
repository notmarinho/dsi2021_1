import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:flutter/material.dart';

class PairSaved extends StatelessWidget {
  const PairSaved({Key? key}) : super(key: key);

  Future<QuerySnapshot<ParPalavra>> getSavedPalavras() async {
    return await FirebaseFirestore.instance
        .collection('palavras')
        .where('isFavorite', isEqualTo: true)
        .withConverter<ParPalavra>(
          fromFirestore: (snapshot, _) => ParPalavra.fromJson(snapshot.data()!),
          toFirestore: (palavra, _) => palavra.toJson(),
        )
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Palavras Curtidas'),
        ),
        body: FutureBuilder(
          future: getSavedPalavras(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<ParPalavra>> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent),
              );
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text(
                'Nenhum item favoritado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ));
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                var data = document.data();

                return Card(
                  child: ListTile(
                    title: Text(data.toString()),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
