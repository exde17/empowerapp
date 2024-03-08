import 'package:flutter/material.dart';
// Importaciones necesarias
import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/utils/bar.dart';
import 'package:empower_app/src/utils/bottom_navigation.dart.dart'; // Corrige el nombre del archivo si es necesario
// import 'package:url_launcher/url_launcher.dart';

class Leyes extends StatefulWidget {
  const Leyes({Key? key}) : super(key: key);

  @override
  LeyesState createState() => LeyesState();
}

class LeyesState extends State<Leyes> {
  int _selectedIndex = 0;

  // Lista de párrafos como cadenas de texto
  final List<String> _paragraphs = [
    "Ley 361 de 1997:",
    "La Ley 361 establece los derechos de las personas con discapacidad y promueve su participación activa en la sociedad.",
    "Accesibilidad Universal:",
    "Se han implementado medidas para mejorar la accesibilidad en espacios públicos, edificaciones y servicios",
    "Educación Inclusiva:",
    "La estrategia 'Educación para Todos' ha avanzado en la integración de estudiantes con discapacidad en entornos educativos regulares."

    // Agrega más párrafos según sea necesario
  ];

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'LEYES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                children: _paragraphs
                    .map((paragraph) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildParagraph(paragraph, context),
                        ))
                    .toList(),
              )

              // ..._paragraphs
              //     .map((paragraph) => Container(
              //           width: 450,
              //           padding: const EdgeInsets.all(16.0),
              //           child: Text(
              //             paragraph,
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize:
              //                   MediaQuery.of(context).size.height * 0.026,
              //             ),
              //             textAlign: TextAlign.justify,
              //           ),
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustonBottomNavigation(
        // selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

Widget buildParagraph(String paragraph, BuildContext context) {
  // Identifica el patrón para hacer en negrita
  final RegExp regExp = RegExp(
      r'(Ley 361 de 1997:|Accesibilidad Universal:|Educación Inclusiva:)');
  Iterable<RegExpMatch> matches = regExp.allMatches(paragraph);

  List<TextSpan> spans = [];
  int start = 0;

  for (var match in matches) {
    // Añade texto normal

    spans.add(TextSpan(text: paragraph.substring(start, match.start)));
    // Añade texto en negrita
    // "Artículo 1.-";
    spans.add(TextSpan(
      text: paragraph.substring(match.start, match.end),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));
    start = match.end;
  }

  // Añade el resto del texto como normal
  if (start < paragraph.length) {
    spans.add(TextSpan(text: paragraph.substring(start, paragraph.length)));
  }

  return RichText(
    textAlign: TextAlign.justify,
    text: TextSpan(
      style: const TextStyle(color: Colors.black, fontSize: 16), // Estilo base
      children: spans,
    ),
  );
}
