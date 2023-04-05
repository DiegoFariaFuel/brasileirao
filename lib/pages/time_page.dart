import 'package:flutter/material.dart';
import '../modelo/time.dart';
import '../modelo/titulo.dart';
// ignore: unused_import
import'../pages/add_titulo_page.dart';

// ignore: must_be_immutable
class TimePage extends StatefulWidget {
  Time time;
  TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
 Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => addTituloPage (time: widget.time, onSave: addTitulo)));
    
  }

  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.titulos.add(titulo);
    });
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Salvo com sucesso'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            
            IconButton( icon:const Icon(Icons.add),onPressed:tituloPage)
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_bar_chart),
                text: 'Estatisticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Titulos',
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Image.network(
                    widget.time.brasao.replaceAll('40x40', '100x100')),
              ),
              Text(
                'Pontos : ${widget.time.pontos}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: widget.time.cor),
              )
            ],
          ),
          titulos()
        ]),
      ),
    );
  }

  Widget titulos() {
    final quantidade = widget.time.titulos.length;
    return quantidade == 0
        // ignore: avoid_unnecessary_containers
        ? Container(
            child: const Center(
              child: Text('Nenhum Titulo ainda!'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(widget.time.titulos[index].campeonato),
                trailing: Text(widget.time.titulos[index].ano),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade);
  }
}
