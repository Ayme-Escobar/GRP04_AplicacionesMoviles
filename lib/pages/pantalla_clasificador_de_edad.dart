import 'package:flutter/material.dart';

class PantallaClasificadorDeEdad extends StatefulWidget {
  @override
  _PantallaClasificadorDeEdadState createState() => _PantallaClasificadorDeEdadState();
}

class _PantallaClasificadorDeEdadState extends State<PantallaClasificadorDeEdad> {
  final TextEditingController _controladorEdad = TextEditingController();
  String _resultado = '';

  void clasificarEdad() {
    setState(() {
      final entradaEdad = _controladorEdad.text;
      if (entradaEdad.isEmpty || int.tryParse(entradaEdad) == null || int.parse(entradaEdad) < 0) {
        _resultado = 'Por favor, ingrese una edad válida.';
        return;
      }

      int edad = int.parse(entradaEdad);
      if (edad <= 10) {
        _resultado = 'NIÑO';
      } else if (edad > 10 && edad <= 14) {
        _resultado = 'PUBER';
      } else if (edad >= 15 && edad <= 18) {
        _resultado = 'ADOLESCENTE';
      } else if (edad >= 19 && edad <= 25) {
        _resultado = 'JOVEN';
      } else if (edad >= 26 && edad <= 65) {
        _resultado = 'ADULTO';
      } else {
        _resultado = 'ANCIANO';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CLASIFICADOR DE EDADES',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: _controladorEdad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese la edad',
                border: OutlineInputBorder(), // Borde añadido
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: clasificarEdad,
              child: Text('Clasificar'),
            ),
            SizedBox(height: 16),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
