import 'package:brasileirao/pages/home_controller.dart';
import 'package:brasileirao/pages/time_page.dart';
import 'package:flutter/material.dart';
import '../modelo/time.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var controller;
  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brasileirao',
          
        ),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (context, int i) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[i].brasao.replaceAll('40x40', '100x100')),
            title: Text(
              tabela[i].nome,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              tabela[i].pontos.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TimePage(
                            key: Key(tabela[i].nome),time: tabela[i],
                          )));
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(15),
      ),
      backgroundColor: Colors.white,
    );
  }
}
