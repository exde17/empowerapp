// import 'package:empower_app/src/screens/home.dart';
import 'package:empower_app/rutes.dart';
import 'package:empower_app/src/screens/registro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _mostrarPassword =
      false; // Estado para controlar la visibilidad de la contraseña
  bool _isLoading = false; // Estado para el indicador de progreso
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el Widget se desmonte
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior /////////////////////////////////////////////////
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Esto deshabilita el botón de regreso automático
        // el resto de tu AppBar aquí
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos dentro de la Row
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
      ),

      // Cuerpo de la pantalla /////////////////////////////////////////////
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            //boton escuchar
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

            // Email////////////////////////////////////////////////////
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: TextField(
                controller: _emailController,
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
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: TextField(
                  controller: _passwordController,
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
            const SizedBox(height: 80),

            // Botón de login///////////////////////////////////////////////
            ElevatedButton(
              onPressed: () {
                // Usar los controladores para obtener el email y la contraseña
                login(_emailController.text, _passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),

            // Texto Registrarme/////////////////////////////////////////////7
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Register()), // Navega a la pantalla de registro
                );
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

            Text(
              'o conectate con',
              style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.07),

            ////////////botones redes sociales/////////////////////////

            Center(
              child: Padding(
                padding: const EdgeInsets.all(
                    8.0), // Ajusta el padding según necesites
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centra los botones en la fila
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
                        padding: const EdgeInsets.all(11), // Tamaño del botón
                      ),
                    ),
                    const SizedBox(width: 40), // Espacio entre los botones

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
                        padding: const EdgeInsets.all(13), // Tamaño del botón
                      ),
                    ),
                    const SizedBox(width: 40), // Espacio entre los botones

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
                        padding: const EdgeInsets.all(14), // Tamaño del botón
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );

    // Widget buildBodyContent() {}
  }

  Future<void> login(String email, String password) async {
    setState(() {
      _isLoading = true; // Inicia el indicador de progreso
    });

    final Uri url = Uri.parse(
        'https://devempowerapp.gatewayit.co/empowerapp/api/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (mounted) {
      setState(() {
        _isLoading = false; // Detiene el indicador de progreso
      });
      // Verifica si el widget aún está montado
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Login exitoso
        // Navigator.pushReplacement(
        //   // Usa pushReplacement para reemplazar la pantalla actual completamente
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           const Home()), // Navega a la pantalla de inicio
        // );
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        // Error al hacer login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al hacer login: ${response.body}')),
        );
      }
    }
  }
}
