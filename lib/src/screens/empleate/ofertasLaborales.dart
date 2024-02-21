import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class OfertasLaborales extends StatefulWidget {
  const OfertasLaborales({Key? key}) : super(key: key);

  @override
  OfertasLaboralesState createState() => OfertasLaboralesState();
}

class OfertasLaboralesState extends State<OfertasLaborales> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.pushNamed(context, Routes.home);
      }
      if (index == 1) {
        Navigator.pushNamed(context, Routes.visibilizate);
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
              'OFERTAS LABORALES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.height * 0.2,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, Routes.visibilizate),
                },
                child: Center(
                  child: Text(
                    'Visibilizate',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            width: 450,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selecciona una Opcion:',
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
          Botones(
            text2: 'Oficios',
            onPressed: () {
              //Navigator.pushNamed(context, Routes.donation);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Botones(
            text2: 'Técnicos',
            onPressed: () {
              //Navigator.pushNamed(context, Routes.donation);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Botones(
            text2: 'Tecnólogicos',
            onPressed: () {
              //Navigator.pushNamed(context, Routes.donation);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Botones(
            text2: 'Profesionales',
            onPressed: () {
              //Navigator.pushNamed(context, Routes.donation);
            },
          ),
        ]))),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}

class Botones extends StatelessWidget {
  final String text2;
  final VoidCallback? onPressed;
  const Botones({
    this.text2 = '',
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.4,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text2,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.023,
            ),
          ),
        ),
      ),
    );
  }
}
