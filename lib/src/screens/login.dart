import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _mostrarPassword =
      false; // Estado para controlar la visibilidad de la contraseña

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Barra superior /////////////////////////////////////////////////
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centra los elementos dentro de la Row
            children: [
              // Aumenta el tamaño del texto del título
              const Text(
                'EmpowerApp', // El título
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold, // Hace el texto más grueso
                  color: Colors
                      .grey, // Color gris oscuro // Ajusta el tamaño del texto según necesites
                ),
              ),
              const SizedBox(width: 10), // Espacio entre el título y la imagen
              // Añade tu imagen
              Image.asset(
                'lib/assets/logoEmpowerapp.png', // Asegúrate de que la ruta de tu imagen sea correcta
                width: 50,
                height: 50,
              ),
            ],
          ),
          centerTitle:
              true, // Centra el Row, pero no sus contenidos internos individualmente

          //boton de opciones
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       // Acción del botón
          //     },
          //     icon: const Icon(Icons.menu), // Ícono de menú
          //   )
          // ]
        ),

        // Cuerpo de la pantalla /////////////////////////////////////////////
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //boton escuchar
              Align(
                alignment:
                    Alignment.centerRight, // Alinea el botón a la derecha
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
                        borderRadius: BorderRadius.circular(
                            20), // Hace el botón redondeado
                      ),
                    ),
                  ),
                ),
              ),

              // Email////////////////////////////////////////////////////
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xFFBEBCBC),
                      fontWeight: FontWeight.w700,
                    ),
                    suffixIcon: Icon(
                      Icons.person, // Ícono de usuario
                      color: Color(0xFFBEBCBC),
                    ),
                  ),
                  onChanged: (value) => {},
                ),
              ),
              const SizedBox(height: 30),

              // Contraseña///////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:
                        !_mostrarPassword, // Usa el estado para controlar si se muestra la contraseña
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Color(0xFFBEBCBC),
                        fontWeight: FontWeight.w700,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Cambia el ícono dependiendo si se muestra o no la contraseña
                          _mostrarPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFFBEBCBC),
                        ),
                        onPressed: () {
                          // Cambia el estado para mostrar u ocultar la contraseña
                          setState(() {
                            _mostrarPassword = !_mostrarPassword;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) => {}),
              ),
              const SizedBox(height: 50),

              // Botón de login///////////////////////////////////////////////
              ElevatedButton(
                onPressed: () {
                  // Acción de login
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20, // Ajusta este valor al tamaño que prefieras
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Texto Registrarme/////////////////////////////////////////////7
              TextButton(
                onPressed: () {
                  // Acción de "¿No tienes cuenta? Registrate"
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '¿No tienes cuenta? ',
                        style: TextStyle(
                          color: Colors.black, // Texto en negro
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Registrate',
                        style: TextStyle(
                          color: Colors.blue, // Texto en azul
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ));
  }
}
