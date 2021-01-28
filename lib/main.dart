import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      // titulo nao apresentavel em tela ( valor interno )
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!!";
  bool _isButtonSubDisabled = false;
  bool _isButtonAddDisabled = false;

  void _changedPeople(int delta){
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Mundo Invertido?";
        _isButtonSubDisabled = true;
      } else if (_people <= 10){
        _infoText = "Pode Entrar.";
        _isButtonAddDisabled = false;
        _isButtonSubDisabled = false;
      }else{
        _infoText = "Lotado!!";
        _isButtonAddDisabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas : $_people",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  onPressed: () {
                    if (!_isButtonAddDisabled){
                      _changedPeople(1);
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  onPressed: () {
                    if (!_isButtonSubDisabled) {
                      _changedPeople(-1);
                    }else{
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      )
    ]);
  }
}
