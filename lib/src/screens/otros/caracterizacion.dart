import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class Caracterizacion extends StatefulWidget {
  const Caracterizacion({Key? key}) : super(key: key);

  @override
  CaracterizacionState createState() => CaracterizacionState();
}

class CaracterizacionState extends State<Caracterizacion> {
  final TextEditingController _tipo = TextEditingController();
  final TextEditingController _origen = TextEditingController();
  final TextEditingController _estrato = TextEditingController();
  final TextEditingController _afiliacion = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el Widget se desmonte
    _tipo.dispose();
    _origen.dispose();
    _estrato.dispose();
    _afiliacion.dispose();
    super.dispose();
  }

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
              'CARACTERIZACIÓN',
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
              'En nuestro compromiso continuo con la inclusión y la equidad, estamos llevando a cabo un proceso de caracterización, para ser parte de ello, completa los siguientes campos:',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.026,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextF(
            controller: _tipo,
            labelText: 'Tipo de discapacidad',
            onChanged: (value) {
              // Acción del campo
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextF(
            controller: _origen,
            labelText: 'Origen',
            onChanged: (value) {
              // Acción del campo
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextF(
            controller: _estrato,
            labelText: 'Estrato',
            onChanged: (value) {
              // Acción del campo
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextF(
            controller: _afiliacion,
            labelText: 'Afiliación a salud',
            onChanged: (value) {
              // Acción del campo
            },
          ),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
          ),

          //boton de registro
          Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height *
                      0.02), // Ajusta el margen según necesites
              child: Align(
                  alignment: Alignment
                      .bottomCenter, // Alinea el botón en la parte inferior central
                  child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.023,
                          fontWeight: FontWeight.bold,
                        ),
                      )))),
        ]))),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}

class TextF extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final void Function(String) onChanged;
  const TextF({
    this.controller,
    required this.labelText,
    required this.onChanged,
    super.key,
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
