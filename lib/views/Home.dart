import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";


  void _calcular(){

    double? precoAlcool = double.tryParse( _controllerAlcool.text );
    double? precoGasolina = double.tryParse( _controllerGasolina.text );

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.) ";
      });
    }else{

      /*
      * Se o preço do álcool divido pelo preço da gasolina
      * for >= a 0.7 é melhor abastecer com gasolina
      * senão é melhor utilizar álcool
      * */
      if( (precoAlcool / precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/images/logo.png"),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"
                ),
                style: const TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59"
                ),
                style: const TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
