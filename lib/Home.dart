import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarCep() async {
    var url = Uri.parse("http://viacep.com.br/ws/88106547/json");

    http.Response response;
    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];

    print(
        "Logradouro: ${logradouro} complemento: ${complemento} bairro: ${bairro}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo Web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _recuperarCep,
              child: Text("Clique"),
            )
          ],
        ),
      ),
    );
  }
}
