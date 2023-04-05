import 'package:brasileirao/modelo/titulo.dart';
import 'package:flutter/material.dart';
import '../modelo/time.dart';
// ignore: unused_import
import '../pages/time_page.dart';

// ignore: camel_case_types, must_be_immutable
class addTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;
  addTituloPage({super.key, required this.time, required this.onSave});

  @override
  State<addTituloPage> createState() => _addTituloPageState();
}

// ignore: camel_case_types
class _addTituloPageState extends State<addTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Titulo'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: _ano,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ano',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o ano do titulo';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: TextFormField(
                  controller: _campeonato,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Campeonato',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe qual e o campeonato!';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () {if(_formKey.currentState!.validate()){widget.onSave(Titulo( ano: _ano.text,campeonato: _campeonato.text));}},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Salvar',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
          )),
    );
  }
}
