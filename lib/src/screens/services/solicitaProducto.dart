import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SolicitaProducto extends StatefulWidget {
  const SolicitaProducto({Key? key}) : super(key: key);

  @override
  SolicitaProductoState createState() => SolicitaProductoState();
}

class SolicitaProductoState extends State<SolicitaProducto> {
  final TextEditingController _nproducto = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el Widget se desmonte
    _nproducto.dispose();
    _cantidad.dispose();
    _descripcion.dispose();
    super.dispose();
  }

  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'SOLICITA PRODUCTO',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.1, // 10% de la altura total de la pantalla
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: ElevatedButton.icon(
                onPressed:
                    pickFile, // Invoca el método para seleccionar un archivo
                icon: const Icon(Icons.file_upload), // Ícono para el botón
                label: const Text("Foto del Producto"), // Texto del botón
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Borde redondeado del botón
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.01, // 10% de la altura total de la pantalla
          ),
          // Texto que muestra el nombre del archivo seleccionado
          Tfield(
            controller: _nproducto,
            labelText: 'Nombre del Producto',
            onChanged: (value) => {},
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.02, // 10% de la altura total de la pantalla
          ),

          //cantidad
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: TextField(
              controller: _cantidad,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
                labelStyle: TextStyle(
                  color: Color(0xFFBEBCBC),
                  fontWeight: FontWeight.w700,
                ),
              ),
              onChanged: (value) => {},
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Tfield(
            controller: _descripcion,
            labelText: 'Descripción',
            onChanged: (value) => {},
          ),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
          ),

          //boton de registro
          ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Solitar',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontWeight: FontWeight.bold,
                ),
              )),

          // const Spacer(), // Espacio entre el botón y el formulario
        ]))),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }

  //widget pata los textfield
}

class Tfield extends StatelessWidget {
  final String labelText;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  const Tfield({
    required this.labelText,
    required this.onChanged,
    this.controller,
    super.key,
    // required TextEditingController nproducto,
  }); //: _nproducto = nproducto;

  // final TextEditingController _nproducto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),

      // padding: const EdgeInsets.symmetric(horizontal: 70),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFFBEBCBC),
            fontWeight: FontWeight.w700,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
