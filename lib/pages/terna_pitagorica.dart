import 'package:flutter/material.dart';

class TernaPitagoricaPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TernaPitagoricaPage();

}

class _TernaPitagoricaPage extends State<TernaPitagoricaPage>{
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String _resultado = '';


  bool esTernaPitagorica(int a, int b, int c) {
    // Comprobar si a^2 + b^2 = c^2 o a^2 + c^2 = b^2 o b^2 + c^2 = a^2
    if ((a * a + b * b == c * c) ||
        (a * a + c * c == b * b) ||
        (b * b + c * c == a * a)) {
      return true;
    } else {
      return false;
    }
  }

  void _comprobarTerna() {
    // Validar que los campos no estén vacíos
    if (_controller1.text.isEmpty || _controller2.text.isEmpty || _controller3.text.isEmpty) {
      _mostrarError("Todos los campos deben estar llenos.");
      return;
    }

    // Convertir los textos a enteros
    int? a = int.tryParse(_controller1.text);
    int? b = int.tryParse(_controller2.text);
    int? c = int.tryParse(_controller3.text);

    // Validar que los valores ingresados sean números
    if (a == null || b == null || c == null) {
      _mostrarError("Ingrese valores numéricos válidos.");
      return;
    }

    // Comprobar si es una terna pitagórica
    setState(() {
      if (esTernaPitagorica(a, b, c)) {
        _resultado = "($a, $b, $c) es una terna pitagórica.";
      } else {
        _resultado = "($a, $b, $c) NO es una terna pitagórica.";
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
        title: Text("Terna Pitagórica".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el valor de a",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el valor de b",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el valor de b",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _comprobarTerna,
              child: Text("Comprobar Terna Pitagórica"),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}