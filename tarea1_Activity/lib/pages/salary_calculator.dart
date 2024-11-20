import 'package:flutter/material.dart';

class SalaryCalculatorScreen extends StatefulWidget {
  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _baseSalaryController = TextEditingController();
  final TextEditingController _salesController = TextEditingController();
  String _result = "";

  void calculateSalary() {
    final double? baseSalary = double.tryParse(_baseSalaryController.text);
    final double? sales = double.tryParse(_salesController.text);

    if (baseSalary == null || sales == null || baseSalary <= 0 || sales < 0) {
      setState(() {
        _result = "Por favor, ingrese valores válidos.";
      });
      return;
    }
    double commission = 0;
    if (sales >= 10000000) {
      commission = sales * 0.07;
    } else if (sales >= 4000000) {
      commission = sales * 0.03;
    }

    final double totalSalary = baseSalary + commission;

    setState(() {
      _result = "El sueldo mensual es: \$${totalSalary.toStringAsFixed(2)}";
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculador de sueldo".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: _baseSalaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Sueldo Base",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _salesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ventas del Mes",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSalary,
              child: Text("Calcular Sueldo"),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
