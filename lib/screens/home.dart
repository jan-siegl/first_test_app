import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //TODO databaze
  var nazev = "Zamek doma";
  var status = "Odemceno";
  var text = "Zamknout";
  var icon = Icons.lock_open;

  void switchStatus() {
    if (status == "Odemceno") {
      setState(() => status = "Zamceno");
      setState(() => icon = Icons.lock);
      setState(() => text = "Odemknout");
    } else {
      setState(() => status = "Odemceno");
      setState(() => icon = Icons.lock_open);
      setState(() => text = "Zamknout");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Zamky"),
        ),
        body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              _buildCard(),
              _buildCard(),
              _buildCard(),
              _buildCard(),
              _buildCard(),
              _buildCard(),
              _buildCard(),
            ]));
  }

  Widget _buildCard(){
    return Container(
      child: Card(
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(icon),
              Text(nazev),
              RaisedButton(
                onPressed: () {
                  switchStatus();
                },
                child: Text(text),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20.0),
        ),
      ),
      margin: const EdgeInsets.all(8.0),
    );
  }
}
