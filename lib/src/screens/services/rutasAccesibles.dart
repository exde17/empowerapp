// import 'package:empower_app/rutes.dart';
// import 'package:empower_app/src/utils/bar.dart';
// import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
// import 'package:flutter/material.dart';

// class RutasAccesibles extends StatefulWidget {
//   const RutasAccesibles({Key? key}) : super(key: key);

//   @override
//   RutasAccesiblesState createState() => RutasAccesiblesState();
// }

// class RutasAccesiblesState extends State<RutasAccesibles> {
//   int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;

//       if (index == 0) {
//         Navigator.pushNamed(context, Routes.home);
//       }
//       if (index == 1) {
//         Navigator.pushNamed(context, Routes.empleate);
//       }
//       if (index == 2) {
//         Navigator.pushNamed(context, Routes.homeServices);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar.buildAppBar(context),
//         body: SingleChildScrollView(
//             child: Center(
//                 child: Column(mainAxisSize: MainAxisSize.max, children: [
//           Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: const EdgeInsets.all(19.0),
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // Acción del botón
//                 },
//                 icon: const Icon(Icons.play_arrow),
//                 label: const Text("Escuchar"),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.05,
//           ),
//           Container(
//             width: double.infinity,
//             color: Colors.blue,
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'RUTAS ACCESIBLES',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: MediaQuery.of(context).size.height * 0.04,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.85,
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Elige tu destino, y selecciona que elementos necesitas en tu ruta, te mostraremos la mejor ruta para ti:',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: MediaQuery.of(context).size.height * 0.026,
//               ),
//               textAlign: TextAlign.justify,
//             ),
//           ),
//         ]))),
//         //bottoms navigations
//         bottomNavigationBar: CustonBottomNavigation(
//           selectedIndex: _selectedIndex,
//           onItemTapped: _onItemTapped,
//         ));
//   }
// }

// import 'package:empower_app/rutes.dart';
import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
// import 'package:empower_app/src/utils/bottom_navigation.dart.dart'; // Asegúrate de que el nombre del archivo sea correcto.
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RutasAccesibles extends StatefulWidget {
  const RutasAccesibles({Key? key}) : super(key: key);

  @override
  RutasAccesiblesState createState() => RutasAccesiblesState();
}

class RutasAccesiblesState extends State<RutasAccesibles> {
  int _selectedIndex = 0;
  GoogleMapController? mapController; // Controlador para Google Map
  Location location = Location();
  LatLng _currentPosition =
      const LatLng(-34.603684, -58.381559); // Un valor predeterminado

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Obtiene la ubicación actual del usuario
  void _getCurrentLocation() async {
    var currentLocation = await location.getLocation();
    setState(() {
      _currentPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushNamed(context, Routes.home);
      }
      if (index == 1) {
        Navigator.pushNamed(context, Routes.empleate);
      }
      if (index == 2) {
        Navigator.pushNamed(context, Routes.homeServices);
      }
      // Aquí puedes controlar la navegación o la lógica de la aplicación basada en el índice
      // No trates de manejar el estado del mapa o la ubicación aquí
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'RUTAS ACCESIBLES',
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
                    'Elige tu destino, y selecciona que elementos necesitas en tu ruta, te mostraremos la mejor ruta para ti:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // Tus widgets van aquí
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition,
                      zoom: 14.0,
                    ),
                    myLocationEnabled:
                        true, // Muestra el botón de ubicación actual
                  ),
                ),
              ],
            ),
          ),
        ),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
