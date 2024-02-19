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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Center(
            child: Text(
              '!Has una Diferencia!',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.bold,
                // fontFamily: 'ProtestRevolution',
                // fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            width: 450,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tu generocidad ayuda a poyar nuestras iniciativas.',
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
          // ignore: avoid_unnecessary_containers
          Container(
            child: Text(
              '!Gracias por tu Donación!',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.026,
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.justify,
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          ////////////////////////////////////////////
          Row(
            //centrar los elementos
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Padding(
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
                    // Usamos MediaQuery para hacer el tamaño de los botones responsive
                    minimumSize: Size(
                        MediaQuery.of(context).size.width *
                            0.4, // Ancho mínimo del botón
                        MediaQuery.of(context).size.height *
                            0.12), // Altura mínima del botón
                  ),
                  onPressed: () {
                    // Your code here
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      // horizontal: 32.0, vertical: 16.0
                      horizontal: MediaQuery.of(context).size.width *
                          0.08, // Aproximadamente 8% del ancho de la pantalla
                      vertical: MediaQuery.of(context).size.height *
                          0.02, // Aproximadamente 2% de la altura de la pantalla
                    ),
                    child: Text(
                      'Monetaria',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ),
                ),
              )),
              Flexible(
                  child: Padding(
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
                    // Usamos MediaQuery para hacer el tamaño de los botones responsive
                    minimumSize: Size(
                        MediaQuery.of(context).size.width *
                            0.4, // Ancho mínimo del botón
                        MediaQuery.of(context).size.height *
                            0.12), // Altura mínima del botón
                  ),
                  onPressed: () {
                    // Your code here
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *
                          0.08, // Aproximadamente 8% del ancho de la pantalla
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Text(
                      'Producto',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ),
                ),
              )),
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
