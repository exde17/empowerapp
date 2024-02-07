// ignore: unused_import
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Barra superior /////////////////////////////////////////////////
        appBar: AppBar(
      title: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centra los elementos dentro de la Row
        children: [
          // Aumenta el tamaño del texto del título
          const Text(
            'EmpowerApp', // El título
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold, // Hace el texto más grueso
              color: Colors
                  .grey, // Color gris oscuro // Ajusta el tamaño del texto según necesites
            ),
          ),
          const SizedBox(width: 10), // Espacio entre el título y la imagen
          // Añade tu imagen
          Image.asset(
            'lib/assets/logoEmpowerapp.png', // Asegúrate de que la ruta de tu imagen sea correcta
            width: 50,
            height: 50,
          ),
        ],
      ),
      centerTitle:
          true, // Centra el Row, pero no sus contenidos internos individualmente
    ));
  }
}
