import 'package:flutter/material.dart';

class CalculadoraCompraArboles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Compra de Árboles'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FormularioArboles(),
    );
  }
}

class FormularioArboles extends StatefulWidget {
  @override
  _FormularioArbolesState createState() => _FormularioArbolesState();
}

class _FormularioArbolesState extends State<FormularioArboles> {
  final _formulario = GlobalKey<FormState>();

  final TextEditingController _controladorPaltos = TextEditingController();
  final TextEditingController _controladorLimones = TextEditingController();
  final TextEditingController _controladorChirimoyos = TextEditingController();

  double _totalPagar = 0.0;

  void _calcularTotal() {
    if (_formulario.currentState!.validate()) {
      // Convertir entradas a enteros
      int cantidadPaltos = int.parse(_controladorPaltos.text);
      int cantidadLimones = int.parse(_controladorLimones.text);
      int cantidadChirimoyos = int.parse(_controladorChirimoyos.text);

      // Definir precios y rebajas
      double precioPalto = 1200;
      double precioLimon = 1000;
      double precioChirimoyo = 980;
      double iva = 0.19;

      // Calcular subtotales
      double subtotalPaltos = cantidadPaltos * precioPalto;
      double subtotalLimones = cantidadLimones * precioLimon;
      double subtotalChirimoyos = cantidadChirimoyos * precioChirimoyo;

      // Aplicar rebajas según cantidades
      if (cantidadPaltos > 100 && cantidadPaltos <= 300) {
        subtotalPaltos *= 0.90; // 10% de descuento
      } else if (cantidadPaltos > 300) {
        subtotalPaltos *= 0.82; // 18% de descuento
      }

      if (cantidadLimones > 100 && cantidadLimones <= 300) {
        subtotalLimones *= 0.875; // 12.5% de descuento
      } else if (cantidadLimones > 300) {
        subtotalLimones *= 0.80; // 20% de descuento
      }

      if (cantidadChirimoyos > 100 && cantidadChirimoyos <= 300) {
        subtotalChirimoyos *= 0.855; // 14.5% de descuento
      } else if (cantidadChirimoyos > 300) {
        subtotalChirimoyos *= 0.81; // 19% de descuento
      }

      // Calcular el total de árboles comprados
      int totalArboles = cantidadPaltos + cantidadLimones + cantidadChirimoyos;

      // Calcular subtotal con rebajas aplicadas
      double subtotal = subtotalPaltos + subtotalLimones + subtotalChirimoyos;

      // Aplicar rebaja adicional si hay más de 1.000 árboles
      if (totalArboles > 1000) {
        subtotal *= 0.85; // 15% de descuento adicional
      }

      // Calcular IVA y total a pagar
      double totalIVA = subtotal * iva;
      double totalPagar = subtotal + totalIVA;

      // Actualizar el estado con el resultado
      setState(() {
        _totalPagar = totalPagar;
      });
    }
  }

  void _mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formulario,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextFormField(
              controller: _controladorPaltos,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cantidad de Paltos",
                border: OutlineInputBorder(),
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return "Por favor, ingrese una cantidad";
                }
                if (int.tryParse(valor) == null || int.parse(valor) < 0) {
                  return "Ingrese un número entero positivo";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controladorLimones,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cantidad de Limones",
                border: OutlineInputBorder(),
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return "Por favor, ingrese una cantidad";
                }
                if (int.tryParse(valor) == null || int.parse(valor) < 0) {
                  return "Ingrese un número entero positivo";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controladorChirimoyos,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cantidad de Chirimoyos",
                border: OutlineInputBorder(),
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return "Por favor, ingrese una cantidad";
                }
                if (int.tryParse(valor) == null || int.parse(valor) < 0) {
                  return "Ingrese un número entero positivo";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularTotal,
              child: Text("Calcular Total"),
            ),
            SizedBox(height: 20),
            Text(
              "Total a pagar: \$${_totalPagar.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
