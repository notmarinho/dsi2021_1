import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/par_palavra.dart';

class PairEdit extends StatefulWidget {
  const PairEdit({Key? key}) : super(key: key);

  @override
  State<PairEdit> createState() => _PairEditState();
}

class _PairEditState extends State<PairEdit> {
  CollectionReference palavrasFirebase =
      FirebaseFirestore.instance.collection('palavras');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool editMode = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _editPalavra(String? documentId, ParPalavra editedPair) async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      isLoading = true;
    });
    return palavrasFirebase
        .doc(documentId)
        .update({
          'primeira': editedPair.primeira,
          'segunda': editedPair.segunda,
        })
        .then((value) => print('Palavra Editada'))
        .catchError((error) => print('Falha ao editar palavra: $error'))
        .whenComplete(() => {
              setState(() {
                isLoading = false;
              }),
              Navigator.pop(context)
            });
  }

  Future<void> _addPalavra(ParPalavra? editedPair) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      isLoading = true;
    });

    return palavrasFirebase
        .add({
          'primeira': editedPair!.primeira,
          'segunda': editedPair.segunda,
          'isFavorite': false,
        })
        .then((value) => print('Palavra adicionada'))
        .catchError((error) => print('Falha ao adicionar palavra: $error'))
        .whenComplete(() => {
              setState(() {
                isLoading = false;
              }),
              Navigator.pop(context)
            });
  }

  @override
  Widget build(BuildContext context) {
    PairSetArguments? screenArguments =
        ModalRoute.of(context)?.settings.arguments as PairSetArguments;

    if (screenArguments.documentId == null) {
      setState(() {
        editMode = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Editar Nome' : 'Adicionar Nome'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: screenArguments.parPalavra.primeira,
                    onChanged: (newValue) =>
                        screenArguments.parPalavra.primeira = newValue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Primeiro nome',
                      labelText: 'Primeiro',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all((10)),
                  ),
                  TextFormField(
                    initialValue: screenArguments.parPalavra.segunda,
                    onChanged: (newValue) =>
                        screenArguments.parPalavra.segunda = newValue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Segundo nome',
                      labelText: 'Segundo',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    editMode
                        ? _editPalavra(screenArguments.documentId,
                            screenArguments.parPalavra)
                        : _addPalavra(screenArguments.parPalavra);
                  },
                  child: isLoading
                      ? const SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          height: 20,
                          width: 20,
                        )
                      : Text(editMode ? "Editar" : 'Adicionar'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class PairSetArguments {
  late final ParPalavra parPalavra;
  final String? documentId;

  PairSetArguments(this.parPalavra, this.documentId);
}
