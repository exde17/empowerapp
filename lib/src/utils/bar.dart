import 'package:empower_app/rutes.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'EmpowerApp',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'lib/assets/logoEmpowerapp.png',
            width: 50,
            height: 50,
          ),
        ],
      ),
      centerTitle: true,
      //boton de opciones
      // leading: IconButton(
      //   icon: const Icon(Icons.menu), // Ícono de menú
      //   onPressed: () {
      //     // Acción del botón
      //   },
      // ),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'perfil') {
              // Navega a la pantalla de perfil
            } else if (value == 'cerrar_sesion') {
              Navigator.pushReplacementNamed(context, Routes.login);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'perfil',
              child: Text('Perfil'),
            ),
            const PopupMenuItem<String>(
              value: 'cerrar_sesion',
              child: Text('Cerrar sesión'),
            ),
          ],
          icon: const Icon(Icons.person, size: 44),
        ),
      ],
    );
  }
}
