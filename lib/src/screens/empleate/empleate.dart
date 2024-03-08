import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class Empleate extends StatefulWidget {
  const Empleate({Key? key}) : super(key: key);

  @override
  EmpleateState createState() => EmpleateState();
}

class EmpleateState extends State<Empleate> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.pushNamed(context, Routes.menuMuevete);
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'EMPLÉATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Gracias al registro de tu perfil, empresas y organizaciones sin ánimo de lucro podrán contactar contigo para el acceso a un empleo remunerado. \nTe invitamos a llenar de manera adecuada tu perfil para que tus necesidades se ajusten a lo ofertado.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.4,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, Routes.hojaVida),
                  },
                  child: Center(
                    child: Text(
                      'Registra tu Hoja de Vida',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.4,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, Routes.ofertasLaborales),
                  },
                  child: Center(
                    child: Text(
                      'Ofertas Laborales',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Empresas asociadas:',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/babaria.png', // Asegúrate de que la ruta de tu imagen sea correcta
                    width: MediaQuery.of(context).size.width * 0.14,
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Image.asset(
                    'lib/assets/universidad.png', // Asegúrate de que la ruta de tu imagen sea correcta
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Image.asset(
                    'lib/assets/cocacola.png', // Asegúrate de que la ruta de tu imagen sea correcta
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              )
            ],
          ),
        )),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
