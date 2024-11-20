import 'package:flutter/material.dart';

class ConsumoElectricoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ConsumoElectricoPage();

}

class _ConsumoElectricoPage extends State<ConsumoElectricoPage>{
  final TextEditingController _controller = TextEditingController();
  double _resultado=0;
  double _subtotal=0;
  double _iva=0;

  void _calcularCobro(){
    if (_controller.text.isEmpty) {
      _mostrarError("El campo no puede estar vacío.");
      return;
    }

    double? consumo = double.tryParse(_controller.text);

    if (consumo == null) {
      _mostrarError("Ingrese un valor numérico válido (solo números).");
      return;
    }

    if (consumo < 0) {
      _mostrarError("El consumo no puede ser negativo.");
      return;
    }
    setState(() {
      if(consumo<=50){
        _subtotal = consumo * 30;
        _iva = _subtotal * 0.15;
        _resultado = _subtotal + _iva;
      }else if (consumo > 50 && consumo <= 100) {
        _subtotal = (50 * 30) + ((consumo - 50) * 35);
        _iva = _subtotal * 0.15;
        _resultado = _subtotal + _iva;
      } else if (consumo > 100) {
        _subtotal = (50 * 30) + (50 * 35) + ((consumo - 100) * 42);
        _iva = _subtotal * 0.15;
        _resultado = _subtotal + _iva;
      }
    });
  }

  void _mostrarError(String message){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo eléctrico".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese su consumo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularCobro,
              child: Text("Calcular Consumo"),
            ),
            SizedBox(height: 20),
            Text(
              "Valor a pagar : \$ $_resultado",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}