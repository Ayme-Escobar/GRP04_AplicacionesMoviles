import 'package:flutter/material.dart';

class PantallaDescuentoCamisetas extends StatefulWidget {
  @override
  _PantallaDescuentoCamisetasState createState() => _PantallaDescuentoCamisetasState();
}

class _PantallaDescuentoCamisetasState extends State<PantallaDescuentoCamisetas> {
  final TextEditingController _controladorPrecio = TextEditingController();
  final TextEditingController _controladorCantidad = TextEditingController();
  String _resultado = '';

  void calcularTotal() {
    setState(() {
      final entradaPrecio = _controladorPrecio.text;
      final entradaCantidad = _controladorCantidad.text;

      if (entradaPrecio.isEmpty || entradaCantidad.isEmpty ||
          double.tryParse(entradaPrecio) == null || int.tryParse(entradaCantidad) == null ||
          double.parse(entradaPrecio) <= 0 || int.parse(entradaCantidad) <= 0) {
        _resultado = 'Por favor, ingrese valores válidos.';
        return;
      }

      double precio = double.parse(entradaPrecio);
      int cantidad = int.parse(entradaCantidad);
      double descuento = 0;

      if (cantidad <= 3) {
        descuento = 0.05;
      } else if (cantidad <= 6) {
        descuento = 0.10;
      } else {
        descuento = 0.20;
      }

      double total = (precio * cantidad) * (1 - descuento);
      _resultado = 'Precio total con descuento: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CÁLCULO DE DESCUENTO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: _controladorPrecio,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Precio unitario de la camisa',
                border: OutlineInputBorder(), // Borde añadido
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controladorCantidad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cantidad de camisas',
                border: OutlineInputBorder(), // Borde añadido
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularTotal,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
