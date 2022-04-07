import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:flutter/material.dart';

import '../utils/appRoutes.dart';
import '../models/par_palavra.dart';

class PairEdit extends StatefulWidget {
  const PairEdit({Key? key}) : super(key: key);

  @override
  State<PairEdit> createState() => _PairEditState();
}

class _PairEditState extends State<PairEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool editMode = true;

  @override
  void initState() {
    super.initState();
  }

  void _pushList(ParPalavra editedPair) {
    Navigator.pop(context, editedPair);
  }

  @override
  Widget build(BuildContext context) {
    ParPalavra? editedPair =
        ModalRoute.of(context)?.settings.arguments as ParPalavra?;

    if (editedPair == null) {
      editedPair = ParPalavra('', '');
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
                    initialValue: editedPair.primeira,
                    onChanged: (newValue) => editedPair!.primeira = newValue,
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
                    initialValue: editedPair.segunda,
                    onChanged: (newValue) => editedPair!.segunda = newValue,
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
                  onPressed: () => _pushList(editedPair!),
                  child: Text(editMode ? "Editar" : 'Adicionar'),
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
