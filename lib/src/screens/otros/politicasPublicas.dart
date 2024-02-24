import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart';
import 'package:empower_app/src/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'package:url_launcher/url_launcher.dart';

class PoliticasPublicas extends StatefulWidget {
  const PoliticasPublicas({Key? key}) : super(key: key);

  @override
  PoliticasPublicasState createState() => PoliticasPublicasState();
}

class PoliticasPublicasState extends State<PoliticasPublicas> {
  void _launchURL() async {
    showCustomToastWithIcon(context, 'Esta funcion esta en construccion');
    // showCustomToast('esta en veremos jejeeje');
    // final Uri url = Uri.parse('https://www.google.com');
    // await canLaunchUrl(url)
    //     ? await launchUrl(url)
    //     : throw 'No se pudo lanzar $url';
  }

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
              'POLÍTICAS PÚBLICAS',
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
          // Container(
          //   width: 450,
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Colombia ha avanzado significativamente en el desarrollo he implementación de políticas públicas que buscan mejorar la calidad de vida de las personas con discapacidad. Estas iniciativas se han centrado en áreas claves como la accesibilidad, la educacion inclusiva, el empleo y la atención médica. Si quieres conoces esas leyes clickea aquí.',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: MediaQuery.of(context).size.height * 0.026,
          //     ),
          //     textAlign: TextAlign.justify,
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.026,
                  color: Colors.black, // Color por defecto para todo el texto
                ),
                children: <TextSpan>[
                  const TextSpan(
                    text:
                        'Colombia ha avanzado significativamente en el desarrollo e implementación de políticas públicas que buscan mejorar la calidad de vida de las personas con discapacidad. Estas iniciativas se han centrado en áreas claves como la accesibilidad, la educación inclusiva, el empleo y la atención médica. Si quieres conocer esas leyes ',
                  ),
                  TextSpan(
                    text: 'clickea aquí.',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _launchURL,
                  ),
                ],
              ),
            ),
          ),
        ]))),
        //bottoms navigations
        bottomNavigationBar: CustonBottomNavigation(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
