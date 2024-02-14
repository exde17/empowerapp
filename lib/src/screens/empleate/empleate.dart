import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/screens/empleate/hojaVida.dart';
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
        Navigator.pushNamed(context, Routes.home);
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
        body: Center(
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
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'EMPLÉATE',
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
                  'Gracias por el registro de tu perfil, empresas y organizaciones sin ánimo de lucro podrán contactarse contigo para el acceso a un empleo remunerado. Te invitamos a llenar de manera adecuada tu perfil para que tus necesidades se ajusten a lo ofertado',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, Routes.hojaVida),
                  },
                  child: const Center(
                    child: Text(
                      'Registra tu Hoja de Vida',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Center(
                    child: Text(
                      'Ofertas Laborales',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
