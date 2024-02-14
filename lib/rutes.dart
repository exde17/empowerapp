import 'package:empower_app/src/screens/empleate/empleate.dart';
import 'package:empower_app/src/screens/empleate/hojaVida.dart';
import 'package:empower_app/src/screens/services/donation.dart';
import 'package:empower_app/src/screens/services/homeServices.dart';
import 'package:flutter/material.dart';
import 'package:empower_app/src/screens/home.dart';
import 'package:empower_app/src/screens/registro.dart';
import 'package:empower_app/src/screens/login.dart';

class Routes {
  static const String home = '/';
  static const String registro = '/registro';
  static const String login = '/login';
  static const String empleate = '/empleate';
  static const String hojaVida = '/hojaVida';
  static const String homeServices = '/homeServices';
  static const String donation = '/donation';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case registro:
        return MaterialPageRoute(builder: (_) => const Register());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case empleate:
        return MaterialPageRoute(builder: (_) => const Empleate());
      case hojaVida:
        return MaterialPageRoute(builder: (_) => const HojaVida());
      case homeServices:
        return MaterialPageRoute(builder: (_) => const HomeServices());
      case donation:
        return MaterialPageRoute(builder: (_) => const Donation());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
