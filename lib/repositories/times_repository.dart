import 'dart:collection';

import 'package:brasileirao/modelo/time.dart';
import '../modelo/titulo.dart';
import 'package:flutter/material.dart';

class TimesRepository extends ChangeNotifier{
  
  // ignore: unused_field
  final List<Time>_time=[];

   UnmodifiableListView <Time> get times => UnmodifiableListView(_time);
  void addTitulo({ required Time time,required Titulo titulo   }){
    time.titulos.add(titulo);
    notifyListeners();
  }

 TimesRepository(){
  _time.addAll([
      Time(nome: 'Botafogo', brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png', pontos: 24,cor:Colors.black),
      Time(nome: 'Flamengo', brasao: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png', pontos: 34,cor: Colors.red),
      Time(nome: 'Cruzeiro', brasao: 'https://logodetimes.com/times/cruzeiro/logo-cruzeiro-256.png', pontos: 35,cor: Colors.blue),
      Time(nome: 'Palmeiras', brasao: 'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png', pontos: 66,cor: Colors.green),
      Time(nome: 'Internacional', brasao: 'https://logodetimes.com/times/internacional/logo-internacional-256.png', pontos: 26,cor: Colors.red),
      Time(nome: 'Santos', brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png', pontos: 45,cor: Colors.black),
      Time(nome: 'Atletico-GO', brasao: 'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-com-estrela-256.png', pontos: 32,cor: Colors.blue),
      Time(nome: 'Corinthians', brasao: 'https://logodetimes.com/times/corinthians/logo-do-corinthians-256.png', pontos: 11,cor: Colors.red),
      Time(nome: 'São Paulo', brasao: 'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png', pontos: 67,cor: Colors.black),
      Time(nome: 'Vasco', brasao: 'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png', pontos: 35,cor: Colors.brown),
      Time(nome: 'Fluminence', brasao: 'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png', pontos: 24,cor: Colors.green),
      Time(nome: 'Ceara', brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png', pontos: 24,cor: Colors.black),
    ]);
 }
}