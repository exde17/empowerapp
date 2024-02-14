import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  DonationState createState() => DonationState();
}

class DonationState extends State<Donation> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Verifica qué ítem se seleccionó y navega a la pantalla correspondiente
      if (index == 0) {
        Navigator.pushNamed(context, Routes.home);
      }
      if (index == 1) {
        Navigator.pushNamed(context, Routes.empleate);
      }
    });
  }

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
              'DONACIONES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 34),
          const Center(
            child: Text(
              '!Has una Diferencia!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Protest Revolution',
                // fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 34),
          Container(
            width: 450,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Tu generocidad ayuda a poyar nuestras iniciativas.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 34),
          Container(
            child: const Text(
              '!Gracias por tu Donación!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.justify,
            ),
          ),

          const SizedBox(height: 54),
          ////////////////////////////////////////////
          Row(
            //centrar los elementos
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 7, 73, 138), // Background color
                    foregroundColor:
                        Colors.white, // Text Color (Foreground color)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fixedSize: const Size(210, 130),
                  ),
                  onPressed: () {
                    // Your code here
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: Text(
                      'Monetaria',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 7, 73, 138), // Background color
                    foregroundColor:
                        Colors.white, // Text Color (Foreground color)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fixedSize: const Size(210, 130),
                  ),
                  onPressed: () {
                    // Your code here
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: Text(
                      'Producto',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ])),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
