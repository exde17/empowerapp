import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class HomeServices extends StatefulWidget {
  const HomeServices({Key? key}) : super(key: key);

  @override
  HomeServicesState createState() => HomeServicesState();
}

class HomeServicesState extends State<HomeServices> {
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
              'SERVICIOS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 2,
            children: <Widget>[
              MenuItem(
                icon: Icons.favorite,
                text: 'Donaciones',
                onTap: () => Navigator.pushNamed(context, Routes.donation),
              ),
              MenuItem(
                icon: Icons.request_page,
                text: 'Solicita productos',
                onTap: () => Navigator.pushNamed(context, Routes.home),
              ),
              MenuItem(
                icon: Icons.shopping_cart,
                text: 'Compra e intercambia',
                onTap: () => Navigator.pushNamed(context, Routes.home),
              ),
              MenuItem(
                icon: Icons.monetization_on,
                text: 'Vende',
                onTap: () => Navigator.pushNamed(context, Routes.home),
              ),
            ],
          )),
        ])),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.blue.withAlpha(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 70.0),
              Text(text, style: const TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
      ),
    );
  }
}
