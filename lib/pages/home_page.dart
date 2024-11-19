import 'descuento_camisas.dart';
import 'pantalla_clasificador_de_edad.dart';
import 'package:flutter/material.dart';
import 'calculadora_compra_arboles.dart';
import 'consumo_electrico_page.dart';
import 'salary_calculator.dart';
import 'terna_pitagorica.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menú Principal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                'Ejercicios',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Ejercicio 1: Clasificador de Edad'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaClasificadorDeEdad()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Ejercicio 2: Descuento Camisas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaDescuentoCamisetas()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.functions),
              title: Text('Ejercicio 3: Terna Pitagórica'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TernaPitagoricaPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Ejercicio 4: Consumo Eléctrico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsumoElectricoPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Ejercicio 5: Sueldo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalaryCalculatorScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.nature),
              title: Text('Ejercicio 6: Calculadora de Compra de Árboles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraCompraArboles()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Acerca de la aplicación'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Integrantes"),
                      content: Text("Echeverría, Escobar, Rivera, Suquillo"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cerrar"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/TareaFondo.png', height: 200),
            SizedBox(height: 20),
            Text(
              'Desliza desde el borde izquierdo o toca el icono de menú para seleccionar un ejercicio.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}