import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "0";

  _recuperarBit() async {
    var url = Uri.parse("https://blockchain.info/ticker");

    http.Response response;
    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _resultado = retorno["BRL"]["last"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bitcoin Price"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Bitcoin Price",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$ " + _resultado,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: _recuperarBit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
