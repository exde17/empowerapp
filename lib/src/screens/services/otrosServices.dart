import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class OtrosService extends StatefulWidget {
  const OtrosService({Key? key}) : super(key: key);

  @override
  OtrosServiceState createState() => OtrosServiceState();
}

class OtrosServiceState extends State<OtrosService> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Verifica qué ítem se seleccionó y navega a la pantalla correspondiente
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
            child: Text(
              'OTROS SERVICIOS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Expanded(
              child: GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 2,
            children: <Widget>[
              MenuItem(
                icon: Icons.account_balance_sharp,
                text: 'Denuncia',
                onTap: () => Navigator.pushNamed(context, Routes.denuncia),
              ),
              MenuItem(
                icon: Icons.emoji_transportation_rounded,
                text: 'Transporte',
                onTap: () => Navigator.pushNamed(context, Routes.transporte),
              ),
              MenuItem(
                icon: Icons.balance_rounded,
                text: 'Leyes',
                onTap: () => Navigator.pushNamed(context, Routes.leyes),
              ),
              MenuItem(
                icon: Icons.route_sharp,
                text: 'Rutas Accesibles',
                onTap: () =>
                    Navigator.pushNamed(context, Routes.rutasAccesibles),
              ),
              // MenuItem(
              //   icon: Icons.room_service,
              //   text: 'Otros servicios',
              //   onTap: () => Navigator.pushNamed(context, Routes.otrosServices),
              // ),
            ],
          )),
        ])),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
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
    // Paleta de colores
    Color blueColor = Colors.blue.shade600;
    Color greyColor = Colors.grey.shade200;
    Color whiteColor = Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: greyColor, // Fondo principal gris claro
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: blueColor.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: blueColor, // Círculo azul para el icono
              radius: 35,
              child: Icon(icon, size: 50.0, color: whiteColor),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: blueColor, // Texto en azul para contraste
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MenuItem extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback onTap;

//   const MenuItem({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.blue.shade400, // Azul claro para un inicio vibrante
//               Colors.grey.shade300, // Gris claro hacia el final para suavizar
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color:
//                   Colors.grey.withOpacity(0.5), // Sombra gris para complementar
//               spreadRadius: 2,
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(icon,
//                 size: 70.0,
//                 color: Colors.white), // Icono en blanco para contraste
//             Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 color: Colors
//                     .white, // Texto en blanco para mantener el contraste y la legibilidad
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


