import 'package:flutter/material.dart';

class Apk extends StatefulWidget {
  @override
  _ApkState createState() => _ApkState();
}

class _ApkState extends State<Apk> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _resultado = "";

  void _calcular(){
     var _alcool = double.tryParse(_controllerAlcool.text);
     var _gasolina = double.tryParse(_controllerGasolina.text);

     setState(() {
       if(_alcool == null || _gasolina == null){
         _resultado = "Preço nulo";
       }
       if((_alcool / _gasolina) >= 0.7){
          _resultado = "Compensa mais a gasolina";
       }else {
         _resultado= "Compensa mais o alcool";
       }

       _limpar();

     });

  }

  void _limpar(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Álcool ou Gasolina ", style: TextStyle(color: Colors.white, fontSize: 25),),

      ),
      body: Container(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a é a melhor opção para abastecimento do seu carro", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço  alcool, 1.59",
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço  gasolina, 3.59"
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding( padding: EdgeInsets.only(top: 10),
                child: RaisedButton(color: Colors.lightBlue,
                    padding: EdgeInsets.all(15),
                    child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 20),),
                    onPressed: () {
                       _calcular();
                    }),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Text(_resultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
