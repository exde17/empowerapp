import 'dart:async';

import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Transporte extends StatefulWidget {
  const Transporte({Key? key}) : super(key: key);

  @override
  TransporteState createState() => TransporteState();
}

class TransporteState extends State<Transporte> {
  LatLng? _currentPosition;
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  GoogleMapController? mapController; // Controlador para Google Map
  Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;

  LatLng alamedas = const LatLng(8.763424695364305, -75.87359486585017);
  LatLng buenaVista = const LatLng(8.778890994380614, -75.86153321796318);
  LatLng nuestro = const LatLng(8.743094687106142, -75.86814777563593);

  // Controladores para los campos de texto
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

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
              'TRANSPORTE',
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
              '¡Solicita un servicio de transporte inclusivo! \n \nPara que un transporte pueda llegar a tu ubicación compártenos la siguiente información y te pondremos en contacto con un conductor.',
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.026,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          //texto comparte ubicacion final
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Comparte tu ubicación final:',
              style: TextStyle(
                color: const Color.fromARGB(179, 2, 33, 235),
                fontSize: MediaQuery.of(context).size.height * 0.026,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          //el mapa
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
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
                    child: const Text('Ir a BuenaVista'),
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
                    labelText: 'Descripción de tu necesidad',
                    hintText: 'Escribe tus comentarios aquí...',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Permite líneas infinitas
                  minLines: 3, // Altura mínima para 3 líneas
                )),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Solicitar transporte'),
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
