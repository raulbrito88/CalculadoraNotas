import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculadoraNotas(),
  ));
}

class CalculadoraNotas extends StatefulWidget {
  const CalculadoraNotas({Key? key}) : super(key: key);

  @override
  CalculadoraNotasEstado createState() => CalculadoraNotasEstado();
}

class CalculadoraNotasEstado extends State<CalculadoraNotas> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  TextEditingController nota4Controller = TextEditingController();

  double promedio = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Notas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: nota1Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Nota 1',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: nota2Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Nota 2',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: nota3Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Nota 3',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: nota4Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Nota 4',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  calcularPromedio();
                },
                child: const Text('Calcular Promedio'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  limpiarCampos();
                },
                child: const Text('Limpiar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calcularPromedio() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;
    double nota3 = double.tryParse(nota3Controller.text) ?? 0.0;
    double nota4 = double.tryParse(nota4Controller.text) ?? 0.0;

    if (nota1 >= 0 && nota1 <= 10 &&
        nota2 >= 0 && nota2 <= 10 &&
        nota3 >= 0 && nota3 <= 10 &&
        nota4 >= 0 && nota4 <= 10) {
      double total = nota1 + nota2 + nota3 + nota4;
      promedio = total / 4;

      if (promedio >= 7.0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                '¡APROBADO!',
                textAlign: TextAlign.center,
              ),
              content: Text('Obtuvo un promedio de $promedio'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                '¡REPROBADO!',
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Obtuvo un promedio de $promedio'),
                  const SizedBox(height: 10),
                  const Text('La nota mínima para aprobar es 7.0'),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Error',
              textAlign: TextAlign.center,
            ),
            content: const Text('Ingrese notas válidas en el rango de 0 a 10.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  void limpiarCampos() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    nota4Controller.clear();
    setState(() {
      promedio = 0.0;
    });
  }
}
