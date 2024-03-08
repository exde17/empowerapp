import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:location/location.dart';

class Denuncia extends StatefulWidget {
  const Denuncia({Key? key}) : super(key: key);

  @override
  DenunciaState createState() => DenunciaState();
}

class DenunciaState extends State<Denuncia> {
  Location location = Location();
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  // Controladores para los campos de texto
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Verifica qué ítem se seleccionó y navega a la pantalla correspondiente
      if (index == 0) {
        Navigator.pushNamed(context, Routes.menuMuevete);
      }
      if (index == 1) {
        Navigator.pushNamed(context, Routes.empleate);
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
        // Ajusta este valor según necesites
        appBar: CustomAppBar.buildAppBar(context),
        body: SingleChildScrollView(
            child: Center(
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
            child: Text(
              'DENUNCIA',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ahora, tú eres parte activa de la seguridad y la organización  de nuestra comunidad. \n\n "¡Haz tu comunidad más inclusiva! Reporta situaciones de movilidad o infraestructura que necesiten atención". ',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.026,
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
                label: const Text("Adjuntar Imagen: "), // Texto del botón
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () => {_shareLocation()},
              child: Center(
                child: Text(
                  'Comparte tu Ubicación',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: _latController,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'latitud',
                      enabled: false,
                      //hintText: '...',
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  controller: _lngController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'longitud',
                    //hintText: '...',
                  ),
                  onChanged: (value) => {},
                  enabled: false,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Comentarios',
                    hintText: 'Escribe tus comentarios aquí...',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Permite líneas infinitas
                  minLines: 3, // Altura mínima para 3 líneas
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () => {
                      // Acción del botón
                    },
                    child: Center(
                      child: Text(
                        'Enviar y recibir seguimiento',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.023,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () => {
                      // Acción del botón
                    },
                    child: Center(
                      child: Text(
                        'Enviar anónimamente',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.023,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]))),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }

  void _shareLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    setState(() {
      _latController.text = "${locationData.latitude}";
      _lngController.text = "${locationData.longitude}";
    });
    // Aquí puedes manejar la ubicación obtenida, por ejemplo, compartiéndola
    // print(
    // "Ubicación actual: ${locationData.latitude},${locationData.longitude}");
  }
}
