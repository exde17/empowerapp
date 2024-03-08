import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class MenuMuevete extends StatefulWidget {
  const MenuMuevete({Key? key}) : super(key: key);

  @override
  MenuMueveteState createState() => MenuMueveteState();
}

class MenuMueveteState extends State<MenuMuevete> {
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
              'MENÚ MUÉVETE',
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
          // Expanded(
          //     child: GridView.count(
          //   shrinkWrap: true,
          //   physics: const ClampingScrollPhysics(),
          //   crossAxisCount: 1,
          //   children: <Widget>[
          //     MenuItem(
          //       icon: Icons.account_balance_sharp,
          //       text: 'Visibilízate',
          //       onTap: () => Navigator.pushNamed(context, Routes.visibilizate),
          //     ),
          //     MenuItem(
          //       icon: Icons.emoji_transportation_rounded,
          //       text: 'Muevete',
          //       onTap: () => Navigator.pushNamed(context, Routes.muevete),
          //     ),
          //   ],
          // )
          // ),
          Expanded(
            child: Center(
              child: GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                crossAxisCount:
                    2, // Ajusta esto para tener más elementos por fila, si es necesario
                crossAxisSpacing:
                    10, // Espacio entre elementos en el eje cruzado
                mainAxisSpacing:
                    10, // Espacio entre elementos en el eje principal
                childAspectRatio:
                    1.5, // Ajusta la relación aspecto para controlar el tamaño de las tarjetas
                children: <Widget>[
                  MenuItem(
                    icon: Icons.account_balance_sharp,
                    text: 'Visibilízate',
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.visibilizate),
                  ),
                  MenuItem(
                    icon: Icons.emoji_transportation_rounded,
                    text: 'Muévete',
                    onTap: () => Navigator.pushNamed(context, Routes.muevete),
                  ),
                ],
              ),
            ),
          )
        ])),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          // selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
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
//     // Paleta de colores
//     Color blueColor = Colors.blue.shade600;
//     Color greyColor = Colors.grey.shade200;
//     Color whiteColor = Colors.white;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: greyColor, // Fondo principal gris claro
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: blueColor.withOpacity(0.5),
//               spreadRadius: 0,
//               blurRadius: 8,
//               offset: const Offset(4, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               backgroundColor: blueColor, // Círculo azul para el icono
//               radius: 35,
//               child: Icon(icon, size: 50.0, color: whiteColor),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: blueColor, // Texto en azul para contraste
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
    // Paleta de colores actualizada para un aspecto más moderno
    Color primaryColor =
        Colors.blue; //deepPurple.shade400; // Nuevo color principal
    Color backgroundColor = Colors.white; // Fondo más claro
    Color iconAndTextColor =
        Colors.deepPurple.shade600; // Color para icono y texto

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150, // Tamaño más pequeño para las tarjetas
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor, // Fondo principal más claro
          borderRadius: BorderRadius.circular(15), // Bordes más suaves
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.5), // Sombra suave
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: primaryColor, // Color primario para el círculo
              radius: 30, // Tamaño más pequeño para el círculo
              child: Icon(icon,
                  size: 40.0, color: backgroundColor), // Icono más pequeño
            ),
            const SizedBox(
                height: 8), // Espacio reducido entre el icono y el texto
            Text(
              text,
              style: TextStyle(
                fontSize: 14.0, // Texto más pequeño
                color: iconAndTextColor, // Color actualizado para el texto
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
