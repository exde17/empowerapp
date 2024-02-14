import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HojaVida extends StatefulWidget {
  const HojaVida({Key? key}) : super(key: key);

  @override
  HojaVidaState createState() => HojaVidaState();
}

class HojaVidaState extends State<HojaVida> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Verifica qué ítem se seleccionó y navega a la pantalla correspondiente
      if (index == 0) {
        Navigator.pushNamed(context, Routes.home);
      }
      if (index == 2) {
        Navigator.pushNamed(context, Routes.homeServices);
      }
    });
  }

/////////////////////////////////////////////////////
  String? fileName;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple:
          false, // Cambia a true si deseas seleccionar múltiples archivos
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        fileName = file.name;
      });
      // Aquí puedes añadir más lógica, como subir el archivo a un servidor o almacenarlo localmente
    } else {
      // El usuario ha cancelado la selección de archivos
    }
  }
////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.buildAppBar(context),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Acción del botón
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text("Escuchar"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'HOJA DE VIDA',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 34),
          Container(
            width: 450,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Gracias al registro de tu hoja de vida podras iniciar con el proceso de postulaciones a las ofertas laborales que tenemos disponibles. Al cargarlo tu hoja de vida será enviada atomáticamente a la empresa que te postules.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: ElevatedButton.icon(
                onPressed:
                    pickFile, // Invoca el método para seleccionar un archivo
                icon: const Icon(Icons.file_upload), // Ícono para el botón
                label: const Text("Cargar Hoja de Vida"), // Texto del botón
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Borde redondeado del botón
                  ),
                ),
              ),
            ),
          ),
          if (fileName != null) ...[
            const SizedBox(height: 20),
            Text(
                "Archivo seleccionado: $fileName"), // Muestra el nombre del archivo seleccionado
          ],
          const SizedBox(height: 64),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.pushNamed(context, Routes.home),
              },
              child: const Center(
                child: Text(
                  'Guardar',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ])),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
