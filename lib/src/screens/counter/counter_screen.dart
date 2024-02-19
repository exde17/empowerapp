// import 'package:flutter/material.dart';

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   int clickCounter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(child: Text('Counter')),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   clickCounter = 0;
//                 });
//               },
//               icon: const Icon(Icons.refresh),
//             )
//           ],
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(clickCounter != 1 ? 'Counters' : 'Counter',
//                   style: const TextStyle(fontSize: 24)),
//               Text('$clickCounter',
//                   style: const TextStyle(
//                       fontSize: 160, fontWeight: FontWeight.w100)),
//               const ElevatedButton(onPressed: null, child: Text('Increment')),
//             ],
//           ),
//         ),
//         floatingActionButton:
//             Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//           BottonGeneral(
//               icon: Icons.plus_one,
//               onPressed: () {
//                 setState(() {
//                   clickCounter++;
//                 });
//               }),

//           const SizedBox(height: 10),

//           BottonGeneral(
//               icon: Icons.exposure_minus_1_outlined,
//               onPressed: () {
//                 setState(() {
//                   clickCounter == 0 ? 0 : clickCounter--;
//                 });
//               })

//           // FloatingActionButton(
//           //   onPressed: () {
//           //     setState(() {
//           //       clickCounter == 0 ? 0 : clickCounter--;
//           //     });
//           //   },
//           //   child: const Icon(Icons.exposure_minus_1_outlined),
//           // )
//         ]));
//   }
// }

// class BottonGeneral extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback? onPressed;

//   const BottonGeneral({
//     super.key,
//     required this.icon,
//     this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       elevation: 10,
//       shape: const StadiumBorder(),
//       onPressed: onPressed,
//       child: Icon(icon),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://your-api.com/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el JSON.
      print('Login successful');
    } else {
      // Si la respuesta no es OK, lanzamos un error.
      print('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
