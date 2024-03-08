import 'dart:async';
import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
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
  LatLng? _currentPosition;

  GoogleMapController? mapController; // Controlador para Google Map
  Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  // LatLng _currentPosition = const LatLng(8.766715943538037, -75.86097289347256); // Un valor predeterminado
  LatLng alamedas = const LatLng(8.763424695364305, -75.87359486585017);
  LatLng buenaVista = const LatLng(8.778890994380614, -75.86153321796318);
  LatLng nuestro = const LatLng(8.743094687106142, -75.86814777563593);
// Agrega aquí más rutas predefinidas

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  final Set<Marker> _markers = {};

  void _updateUserLocationMarker(LatLng position) {
    setState(() {
      _markers.removeWhere(
          (marker) => marker.markerId == const MarkerId('userLocation'));
      _markers.add(
        Marker(
          markerId: const MarkerId('userLocation'),
          position: position,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  void _getCurrentLocation() {
    _locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _updateUserLocationMarker(_currentPosition!);
        _goToRoute(_currentPosition!);
      });
    });
  }

  void _goToRoute(LatLng route) {
    _locationSubscription
        ?.cancel(); // Detiene la suscripción a cambios de ubicación si la hay.
    setState(() {
      _currentPosition =
          route; // Actualiza la posición actual con la nueva ruta.
      _updateUserLocationMarker(
          route); // Actualiza el marcador a la nueva ubicación.
    });
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: route, zoom: 14.0),
      ),
    );
  }

  // // Obtiene la ubicación actual del usuario
  // void _getCurrentLocation() async {
  //   var currentLocation = await location.getLocation();
  //   setState(() {
  //     _currentPosition =
  //         LatLng(currentLocation.latitude!, currentLocation.longitude!);
  //   });
  // }

  // //otras ubicaciones
  // void _goToRoute(LatLng route) {
  //   mapController?.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(target: route, zoom: 14.0),
  //     ),
  //   );
  // }

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
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.5,
                //   width: MediaQuery.of(context).size.width * 0.85,
                //   child: GoogleMap(
                //     onMapCreated: (GoogleMapController controller) {
                //       mapController = controller;
                //     },
                //     initialCameraPosition: CameraPosition(
                //       target: _currentPosition,
                //       zoom: 14.0,
                //     ),
                //     myLocationEnabled:
                //         true, // Muestra el botón de ubicación actual
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: _currentPosition == null
                      ? const Center(
                          child:
                              CircularProgressIndicator()) // Muestra un indicador de carga mientras la ubicación está cargando
                      : GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            target: _currentPosition!,
                            zoom: 14.0,
                          ),
                          myLocationEnabled:
                              true, // Muestra el botón de ubicación actual
                        ),
                ),

                SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Permite el desplazamiento horizontal
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _goToRoute(alamedas);
                          },
                          child: const Text('Ir a Alamedas'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _goToRoute(buenaVista);
                          },
                          child: const Text('Ir a Buenavista'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _goToRoute(nuestro);
                          },
                          child: const Text('Ir a Nuestro Hogar'),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
