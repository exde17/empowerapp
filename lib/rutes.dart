import 'package:empower_app/src/screens/empleate/empleate.dart';
import 'package:empower_app/src/screens/empleate/hojaVida.dart';
import 'package:empower_app/src/screens/empleate/ofertasLaborales.dart';
import 'package:empower_app/src/screens/empleate/promuevete.dart';
import 'package:empower_app/src/screens/otros/caracterizacion.dart';
import 'package:empower_app/src/screens/otros/certificate.dart';
import 'package:empower_app/src/screens/otros/politicasPublicas.dart';
import 'package:empower_app/src/screens/services/denuncia.dart';
import 'package:empower_app/src/screens/services/donation.dart';
import 'package:empower_app/src/screens/services/homeServices.dart';
import 'package:empower_app/src/screens/services/leyes.dart';
import 'package:empower_app/src/screens/services/muevete.dart';
import 'package:empower_app/src/screens/services/rutasAccesibles.dart';
import 'package:empower_app/src/screens/services/solicitaProducto.dart';
import 'package:empower_app/src/screens/services/vende.dart';
import 'package:empower_app/src/screens/empleate/visibilizate.dart';
import 'package:flutter/material.dart';
import 'package:empower_app/src/screens/home.dart';
import 'package:empower_app/src/screens/registro.dart';
import 'package:empower_app/src/screens/login.dart';
import 'package:empower_app/src/screens/services/OtrosServices.dart';

class Routes {
  static const String home = '/';
  static const String registro = '/registro';
  static const String login = '/login';
  static const String empleate = '/empleate';
  static const String hojaVida = '/hojaVida';
  static const String homeServices = '/homeServices';
  static const String donation = '/donation';
  static const String solicitaProducto = '/solicitaProducto';
  static const String vende = '/vende';
  static const String promuevete = '/promuevete';
  static const String visibilizate = '/visibilizate';
  static const String ofertasLaborales = '/ofertasLaborales';
  static const String caracterizacion = '/caracterizacion';
  static const String certificate = '/certificate';
  static const String politicasPublicas = '/politicasPublicas';
  static const String otrosServices = '/OtrosServices';
  static const String leyes = '/leyes';
  static const String denuncia = '/denuncia';
  static const String rutasAccesibles = '/rutasAccesibles';
  static const String muevete = '/muevete';

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
      case solicitaProducto:
        return MaterialPageRoute(builder: (_) => const SolicitaProducto());
      case vende:
        return MaterialPageRoute(builder: (_) => const Vende());
      case promuevete:
        return MaterialPageRoute(builder: (_) => const Promuevete());
      case visibilizate:
        return MaterialPageRoute(builder: (_) => const Visibilizate());
      case ofertasLaborales:
        return MaterialPageRoute(builder: (_) => const OfertasLaborales());
      case caracterizacion:
        return MaterialPageRoute(builder: (_) => const Caracterizacion());
      case certificate:
        return MaterialPageRoute(builder: (_) => const Certificate());
      case politicasPublicas:
        return MaterialPageRoute(builder: (_) => const PoliticasPublicas());
      case otrosServices:
        return MaterialPageRoute(builder: (_) => const OtrosService());
      case leyes:
        return MaterialPageRoute(builder: (_) => const Leyes());
      case denuncia:
        return MaterialPageRoute(builder: (_) => const Denuncia());
      case rutasAccesibles:
        return MaterialPageRoute(builder: (_) => const RutasAccesibles());
      case muevete:
        return MaterialPageRoute(builder: (_) => const Muevete());
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
