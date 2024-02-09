import 'package:empower_app/rutes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0; // Ahora es parte de un StatefulWidget

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const SizedBox(height: 40);
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centra los elementos dentro de la Row
            children: [
              const Text(
                'EmpowerApp', // El título
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold, // Hace el texto más grueso
                  color: Colors.grey, // Color gris oscuro
                ),
              ),
              const SizedBox(width: 10), // Espacio entre el título y la imagen
              Image.asset(
                'lib/assets/logoEmpowerapp.png', // Asegúrate de que la ruta de tu imagen sea correcta
                width: 50,
                height: 50,
              ),
            ],
          ),
          centerTitle:
              true, // Centra el Row, pero no sus contenidos internos individualmente

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
                // Añade tu lógica aquí, basada en el valor seleccionado
                // Por ejemplo:
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
              icon: const Icon(Icons.person,
                  size: 44), // Puedes ajustar el tamaño aquí si es necesario
            ),
          ]),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerRight, // Alinea el botón a la derecha
              child: Padding(
                padding: const EdgeInsets.all(
                    19.0), // Añade un poco de espacio alrededor del botón
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Acción del botón
                  },
                  icon: const Icon(Icons.play_arrow), // Ícono de reproducción
                  label: const Text("Escuchar"), // Texto del botón
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Hace el botón redondeado
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            Image.asset(
              'lib/assets/home.png', // Asegúrate de que la ruta de tu imagen sea correcta
              width: 500,
              height: 570,
            ),

            const Spacer(),
            // Espacio entre el botón y el formulario
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Empleate'),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service), label: 'Servicios'),
          // BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Tienda'),
          // BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Muevete'),
          // BottomNavigationBarItem(icon: Icon(Icons.gif), label: 'Donación'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
