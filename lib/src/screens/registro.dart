import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos dentro de la Row
          children: [
            const Text(
              'EmpowerApp', // El título
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold, // Hace el texto más grueso
                color: Colors.grey, // Color gris oscuro
              ),
            ),
            const SizedBox(width: 10), // Espacio entre el título y la imagen
            Image.asset(
              'lib/assets/logoEmpowerapp.png', // Asegúrate de que la ruta de tu imagen sea correcta
              width: 50,
              height: 50,
            ),
          ],
        ),
        centerTitle:
            true, // Centra el Row, pero no sus contenidos internos individualmente
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerRight, // Alinea el botón a la derecha
              child: Padding(
                padding: const EdgeInsets.all(
                    19.0), // Añade un poco de espacio alrededor del botón
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Acción del botón
                  },
                  icon: const Icon(Icons.play_arrow), // Ícono de reproducción
                  label: const Text("Escuchar"), // Texto del botón
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Hace el botón redondeado
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(), // Espacio entre el botón y el formulario

            // Campo de texto para el nombre
            Textt(
              labelText: 'Nombre',
              onChanged: (value) => {},
            ),

            const SizedBox(height: 20), // Espacio entre los campos de texto
            Textt(
              labelText: 'Apellido',
              onChanged: (value) => {},
            ),

            // Campo de texto para el correo electrónico

            const SizedBox(height: 20),

            // Campo de texto para la contraseña
            Textt(
              labelText: 'Contraseña',
              onChanged: (value) => {},
            ),

            const SizedBox(height: 20),

            Textt(
              labelText: 'Confirmar Contraseña',
              onChanged: (value) => {},
            ),

            const SizedBox(height: 80),
            //boton de registro
            ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),

            const SizedBox(height: 20),

            //redes sociales
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Ajusta el padding según necesites
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centra los botones en la fila
                        children: [
                          // Botón de Facebook
                          ElevatedButton.icon(
                            icon: const Icon(
                              FontAwesomeIcons.facebookF, // Ícono de Facebook
                              color: Colors.white,
                              size: 40,
                            ),
                            label: const Text(''),
                            onPressed: () {
                              // Lógica para iniciar sesión con Facebook
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 7, 67, 187), // Color de Facebook
                              shape: const CircleBorder(), // Forma circular
                              padding:
                                  const EdgeInsets.all(11), // Tamaño del botón
                            ),
                          ),

                          const SizedBox(
                              width: 40), // Espacio entre los botones

                          // Botón de Google
                          ElevatedButton.icon(
                            icon: const Icon(
                              FontAwesomeIcons.google, // Ícono de Google
                              color: Colors.white,
                              size: 35,
                            ),
                            label: const Text(''),
                            onPressed: () {
                              // Lógica para iniciar sesión con Google
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 211, 26, 9), // Color de Google
                              shape: const CircleBorder(), // Forma circular
                              padding:
                                  const EdgeInsets.all(13), // Tamaño del botón
                            ),
                          ),
                          const SizedBox(
                              width: 40), // Espacio entre los botones

                          // Botón de LinkedIn
                          ElevatedButton.icon(
                            icon: const Icon(
                              FontAwesomeIcons.linkedin, // Ícono de LinkedIn
                              color: Colors.white,
                              size: 32,
                            ),
                            label: const Text(''),
                            onPressed: () {
                              // Lógica para iniciar sesión con LinkedIn
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 2, 141, 215), // Color de LinkedIn
                              shape: const CircleBorder(), // Forma circular
                              padding:
                                  const EdgeInsets.all(14), // Tamaño del botón
                            ),
                          ),
                        ]))),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

//WIDGET PARA LOS LabelText
class Textt extends StatelessWidget {
  final String labelText;
  final void Function(String) onChanged;
  const Textt({
    super.key,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFFBEBCBC),
            fontWeight: FontWeight.w700,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
