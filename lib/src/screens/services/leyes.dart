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
    "Artículo 1.- Los principios que inspiran la presente Ley, se fundamentan en los artículos 13, 47, 54 y 68 que la Constitución Nacional reconocen en consideración a al dignidad que le es propia a las personas con limitación en sus derechos fundamentales, económicos, sociales y culturales para su completa realización personal y su total integración social y a las personas con limitaciones severas y profundas, la asistencia y protección necesarias.",
    "Artículo 2.- El Estado garantizará y velará por que en su ordenamiento jurídico no prevalezca discriminación sobre habitante alguno en su territorio, por circunstancias personales, económicas, físicas, fisiológicas, síquicas, sensoriales y sociales.",
    "Artículo 3.- El Estado Colombiano inspira esta ley para la normalización social plena y la total integración de las personas con limitación y otras disposiciones legales que se expidan sobre la materia en la Declaración de los Derechos Humanos proclamada por las Naciones Unidas en el año de 1948, en la Declaración de los Derechos del Deficiente Mental aprobada por la ONU el 20 de diciembre de 1971, en la Declaración de los Derechos de las Personas con Limitación, aprobada por la Resolución 3447 de la misma organización, del 9 de diciembre de 1975, en el Convenio 159 de la OIT, en la Declaración de Sund Berg de Torremolinos, Unesco 1981, en la Declaración de las Naciones Unidas concernientes a las personas con limitación de 1983 y en la recomendación 168 de la OIT de 1983. Ver la Ley 762 de 2002",
    "Artículo 4.- Las ramas del poder público pondrán a disposición todos los recursos necesarios para el ejercicio de los derechos a que se refiere el artículo 1 de la presente ley, siendo obligación ineludible del Estado la prevención, los cuidados médicos y sicológicos, la habilitación y la rehabilitación adecuadas, la educación apropiada, la orientación, la integración laboral, la garantía de los derechos fundamentales económicos, culturales y sociales. \nPara estos efectos estarán obligados a participar para su eficaz realización, la administración central el sector descentralizado, las administraciones departamentales, distritales y municipales, todas las corporaciones públicas y privadas del país.",
    "Artículo 5.- Las personas con limitación deberán aparecer calificadas como tales en el carné de afiliado al Sistema de Seguridad en Salud, ya sea el régimen contributivo o subsidiado. Para tal efecto las empresas promotoras de salud deberán consignar la existencia de la respectiva limitación en el carné de afiliado, para lo cual solicitarán en el formulario de afiliación la información respectiva y la verificación a través de diagnóstico médico en caso de que dicha limitación no sea evidente. \nDicho carné especificará el carácter de persona con limitación y el grado de limitación moderada, severa o profunda de la persona. Servirá para identificarse como titular de los derechos establecidos en la presente Ley. NOTA: Texto subrayado declarado  EXEQUIBLE mediante Sentencia de la Corte Constitucional C-606 de 2012 El Consejo Nacional de Seguridad Social en Salud realizará las modificaciones necesarias al formulario de afiliación y al carné de los afiliados al Sistema General de Seguridad Social en Salud con el objeto de incorporar las modificaciones aquí señaladas. \nLo dispuesto en este artículo se entiende sin perjuicio de las políticas que con relación a las personas con limitación establezca el 'Comité Consultivo Nacional de las Personas con Limitación' a que se refiere el artículo siguiente."
    // Agrega más párrafos según sea necesario
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushNamed(context, Routes.visibilizate);
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
  final RegExp regExp = RegExp(r'Artículo \d+\.-');
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
