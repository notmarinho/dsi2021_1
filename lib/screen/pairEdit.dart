import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:flutter/material.dart';

import '../utils/appRoutes.dart';

class PairEdit extends StatefulWidget {
  const PairEdit({Key? key}) : super(key: key);

  @override
  State<PairEdit> createState() => _PairEditState();
}

class _PairEditState extends State<PairEdit> {
  final firstNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    firstNameController.addListener(() => setState(() {}));
  }

  void _pushList(ParPalavra editedPair) {
    Navigator.pop(context, editedPair);
    // Navigator.of(context).pushNamed(AppRoutes.PAIR_LIST, arguments: editedPair);
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'O nome nao pode ser vazio';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ParPalavra pair = ModalRoute.of(context)?.settings.arguments
        as ParPalavra; // Palavra recebida atraves do navigation

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Nome'),
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
                    validator: validateField,
                    initialValue: pair.primeira,
                    onChanged: (newValue) => setState(() {
                      pair.primeira = newValue;
                    }),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Primeiro nome',
                      labelText: 'Primeiro',
                      suffixIcon: firstNameController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              onPressed: () => firstNameController.clear(),
                              icon: const Icon(Icons.close),
                            ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all((10)),
                  ),
                  TextFormField(
                    validator: validateField,
                    initialValue: pair.segunda,
                    onChanged: (newValue) => setState(() {
                      pair.segunda = newValue;
                    }),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Segundo nome',
                      labelText: 'Segundo',
                      suffixIcon: firstNameController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              onPressed: () => firstNameController.clear(),
                              icon: const Icon(Icons.close),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Text(pair.primeira),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _pushList(pair),
                  child: const Text("Editar"),
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
