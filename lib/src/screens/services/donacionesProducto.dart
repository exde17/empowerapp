import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

TextEditingController _nombreProductoController = TextEditingController();
TextEditingController _descripcionController = TextEditingController();
TextEditingController _cantidadController = TextEditingController();
TextEditingController _nombreController = TextEditingController();
TextEditingController _telefonoController = TextEditingController();

class DonacionesProducto extends StatefulWidget {
  const DonacionesProducto({Key? key}) : super(key: key);

  @override
  DonacionesProductoState createState() => DonacionesProductoState();
}

class DonacionesProductoState extends State<DonacionesProducto> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

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

  /////uso de subir archivo//////////////////
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
              'DONACIONES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text('Donación de Productos',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.bold,
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Para donar productos recuerda que los productos deben estar en buen estado, para realizar la donación diligencia el siguiente formulario.',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.026,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: ElevatedButton.icon(
                onPressed:
                    pickFile, // Invoca el método para seleccionar un archivo
                icon: const Icon(Icons.file_upload), // Ícono para el botón
                label: const Text("Foto de Producto"), // Texto del botón
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Textt(
            labelText: 'Nombre del Producto',
            controller: _nombreProductoController,
            onChanged: (value) {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Textt(
            labelText: 'Descripción',
            controller: _descripcionController,
            onChanged: (value) {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: TextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
                labelStyle: TextStyle(
                  color: Color(0xFFBEBCBC),
                  fontWeight: FontWeight.w700,
                ),
              ),
              onChanged: (value) {
                // Acción del botón
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Textt(
            labelText: 'Nombre (opcional)',
            controller: _nombreController,
            onChanged: (value) {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: TextField(
              controller: _telefonoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Telefono',
                labelStyle: TextStyle(
                  color: Color(0xFFBEBCBC),
                  fontWeight: FontWeight.w700,
                ),
              ),
              onChanged: (value) {
                // Acción del botón
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const DonationCheckbox(),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          //boton guardar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, Routes.home),
                },
                child: Center(
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]))),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}

//WIDGET PARA LOS LabelText
class Textt extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  const Textt({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
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

//////////////////////WIDGET PARA EL CHECKBOX////////////////////////
class DonationCheckbox extends StatefulWidget {
  const DonationCheckbox({super.key});

  @override
  DonationCheckboxState createState() => DonationCheckboxState();
}

class DonationCheckboxState extends State<DonationCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    // Calculamos un tamaño de fuente basado en el ancho de la pantalla
    double fontSize = MediaQuery.of(context).size.width *
        0.02; // Ajusta el 0.04 según necesites

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            value: _isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                _isChecked = newValue!;
              });
            },
          ),
          Expanded(
            // Usamos Expanded para evitar overflow si el texto es muy largo
            child: Text(
              'Aceptar para que su donación sea procesada por la app EmpowerApp',
              style: TextStyle(
                  fontSize:
                      fontSize), // Aplicamos el tamaño de fuente calculado
            ),
          ),
        ],
      ),
    );
  }
}
