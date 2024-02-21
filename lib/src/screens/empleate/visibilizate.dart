import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class Visibilizate extends StatefulWidget {
  const Visibilizate({Key? key}) : super(key: key);

  @override
  VisibilizateState createState() => VisibilizateState();
}

class VisibilizateState extends State<Visibilizate> {
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
              'VISIBILÍZATE',
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
            width: 450,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Con el fin de visibilazarte dentro dentro de la sociedad, ofreceremos los siguites servicios para ti: ',
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
          Botoness(
            text2: 'Caracterización',
            onPressed: () {
              Navigator.pushNamed(context, Routes.caracterizacion);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Botoness(
            text2: 'Certifícate',
            onPressed: () {
              Navigator.pushNamed(context, Routes.certificate);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Botoness(
            text2: 'Politicas Publicas',
            onPressed: () {
              Navigator.pushNamed(context, Routes.politicasPublicas);
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

class Botoness extends StatelessWidget {
  final VoidCallback?
      onPressed; // Corregido para definir onPressed correctamente
  final String text2;
  const Botoness({
    this.onPressed,
    this.text2 = '',
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
